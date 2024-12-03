import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/providers_extension.dart';
import 'package:nashmi_app/widgets/provider_builder.dart';

import '../../models/favorite/favorite_model.dart';
import '../../widgets/builders/custom_firestore_query_builder.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late Query<FavoriteModel> _query;

  void _initializeQuery() {
    _query = context.userProvider.favoritesCollectionRef;
  }

  @override
  void initState() {
    super.initState();
    _initializeQuery();
  }

  @override
  Widget build(BuildContext context) {
    return CustomFirestoreQueryBuilder(
      query: _query,
      onComplete: (context, snapshot) {
        final favorites = snapshot.docs;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              context.appLocalization.favoritesList,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final documentSnapshot = favorites[index];
              final id = documentSnapshot.id;
              return ProviderBuilder(
                key: ValueKey(id),
                id: id,
              );
            },
          ),
        );
      },
    );
  }
}
