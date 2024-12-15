import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nashmi_app/alerts/errors/app_error_widget.dart';
import 'package:nashmi_app/network/api_service.dart';
import 'package:nashmi_app/network/my_fields.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/widgets/provider_shimmer.dart';

import '../../../network/fire_queries.dart';
import '../../../utils/dimensions.dart';
import '../models/provider/provider_model.dart';
import '../screens/provider/provider_screen.dart';
import '../utils/my_theme.dart';
import 'custom_future_builder.dart';
import 'custom_network_image.dart';

class SearchBuilder extends StatefulWidget {
  final List<ProviderModel> providers;
  final List<String> tagIds;

  const SearchBuilder({
    super.key,
    required this.tagIds,
    required this.providers,
  });

  @override
  State<SearchBuilder> createState() => _SearchBuilderState();
}

class _SearchBuilderState extends State<SearchBuilder> {
  late Future<List<dynamic>> _futures;

  List<String> get _tagsIds => widget.tagIds;
  FirebaseFirestore get _firebaseFirestore => FirebaseFirestore.instance;

  void _initialize() {
    _futures = ApiService.build(
      callBack: () async {
        final providersFuture = Future.value(widget.providers);
        late Future<List<ProviderModel>> tagsFuture;
        if (_tagsIds.isNotEmpty) {
          tagsFuture = _firebaseFirestore.providers.where(MyFields.tagIds, arrayContainsAny: _tagsIds).get().then((value) {
            return value.docs.map((e) => e.data()).toList();
          });
        } else {
          tagsFuture = Future.value([]);
        }

        return Future.wait([providersFuture, tagsFuture]);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder(
      future: _futures,
      onError: (error) {
        return AppErrorWidget(
          error: error,
          onRetry: () {
            setState(() {
              _initialize();
            });
          },
        );
      },
      onLoading: () {
        return ListView.separated(
          padding: const EdgeInsets.all(kScreenMargin),
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          shrinkWrap: true,
          itemCount: 20,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return const ProviderShimmer();
          },
        );
      },
      onComplete: (context, snapshot) {
        final p1 = snapshot.data![0] as List<ProviderModel>;
        final p2 = snapshot.data![1] as List<ProviderModel>;

        final providers = [...p1, ...p2];

        return Column(
          children: List.generate(
            providers.length,
            (int index) {
              final element = providers[index];
              return ListTile(
                onTap: () {
                  context.navigate((context) {
                    return ProviderScreen(
                      provider: element,
                      id: null,
                    );
                  });
                },
                leading: CustomNetworkImage(
                  element.thumbnail!,
                  height: 45,
                  width: 45,
                  radius: MyTheme.radiusPrimary,
                ),
                title: Text(
                  context.translate(textEN: element.nameEn, textAR: element.nameAr),
                ),
                subtitle: Text(
                  context.translate(textEN: element.descriptionEn, textAR: element.descriptionAr),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 13,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
