import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nashmi_app/alerts/errors/app_error_widget.dart';
import 'package:nashmi_app/network/api_service.dart';
import 'package:nashmi_app/screens/provider/widgets/provider_card.dart';
import 'package:nashmi_app/utils/providers_extension.dart';
import 'package:nashmi_app/widgets/provider_shimmer.dart';

import '../../../network/fire_queries.dart';
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
  late Future<DocumentSnapshot<ProviderModel>> _providersFuture;

  String get _providerId => widget.id;
  FirebaseFirestore get _firebaseFirestore => FirebaseFirestore.instance;

  void _initialize() {
    _providersFuture = ApiService.build(
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
      future: _providersFuture,
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
        return const ProviderShimmer();
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
