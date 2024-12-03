import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nashmi_app/alerts/errors/app_error_widget.dart';
import 'package:nashmi_app/network/api_service.dart';
import 'package:nashmi_app/screens/provider/widgets/provider_card.dart';
import 'package:nashmi_app/utils/providers_extension.dart';
import 'package:nashmi_app/widgets/shimmer/shimmer_loading.dart';

import '../../../network/fire_queries.dart';
import '../../../utils/dimensions.dart';
import '../models/provider/provider_model.dart';
import 'custom_future_builder.dart';

class ProviderBuilder extends StatefulWidget {
  final String id;

  const ProviderBuilder({
    super.key,
    required this.id,
  });

  @override
  State<ProviderBuilder> createState() => _ProviderBuilderState();
}

class _ProviderBuilderState extends State<ProviderBuilder> {
  late Future<DocumentSnapshot<ProviderModel>> _productsFuture;

  String get _providerId => widget.id;
  FirebaseFirestore get _firebaseFirestore => FirebaseFirestore.instance;

  void _initialize() {
    _productsFuture = ApiService.build(
      callBack: () async {
        return _firebaseFirestore.providers.doc(_providerId).get();
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
      future: _productsFuture,
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
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: ShimmerLoading(
              builder: (context, bubble) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    bubble(
                      height: 120,
                      width: 120,
                      margin: const EdgeInsetsDirectional.only(end: 10),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          bubble(
                            height: kTextShimmerHeight,
                            width: 70,
                          ),
                          bubble(
                            height: kTextShimmerHeight,
                            width: 120,
                            margin: const EdgeInsets.symmetric(vertical: 5),
                          ),
                          SizedBox(
                            height: 70,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  bubble(
                                    height: kTextShimmerHeight,
                                    width: 50,
                                  ),
                                  bubble(
                                    height: 30,
                                    width: 30,
                                    radius: 100,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
      onComplete: (context, snapshot) {
        final provider = snapshot.data!.data();

        if (provider == null) {
          context.userProvider.favoritesCollectionRef.doc(_providerId).delete();
          return const SizedBox.shrink();
        }

        return ProviderCard(
          provider: provider,
          showFav: true,
        );
      },
    );
  }
}
