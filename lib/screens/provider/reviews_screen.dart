import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nashmi_app/screens/provider/widgets/review_bubble.dart';

import '../../models/review/review_model.dart';
import '../../network/fire_queries.dart';
import '../../network/my_collections.dart';
import '../../network/my_fields.dart';
import '../../utils/base_extensions.dart';
import '../../utils/dimensions.dart';
import '../../widgets/fire_paginator/fire_paginator.dart';

class ReviewsScreen extends StatefulWidget {
  final String id;

  const ReviewsScreen({
    super.key,
    required this.id,
  });

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  late Query<ReviewModel> _reviewsQuery;

  FirebaseFirestore get _firebaseFirestore => FirebaseFirestore.instance;

  void _initializeReviewsFuture() {
    _reviewsQuery = _firebaseFirestore.providers
        .doc(widget.id)
        .collection(MyCollections.reviews)
        .where(MyFields.published, isEqualTo: true)
        .withConverter<ReviewModel>(
          fromFirestore: (snapshot, _) => ReviewModel.fromJson(snapshot.data()!),
          toFirestore: (snapshot, _) => snapshot.toJson(),
        )
        .orderBy(MyFields.createdAt, descending: true);
  }

  @override
  void initState() {
    super.initState();
    _initializeReviewsFuture();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.appLocalization.reviews),
      ),
      body: FirePaginator(
        query: _reviewsQuery,
        builder: (context, snapshot) {
          if (snapshot.docs.isEmpty) {
            return const SizedBox.shrink();
          }
          return ListView.separated(
            itemCount: snapshot.docs.length,
            padding: const EdgeInsets.all(kScreenMargin),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
                snapshot.fetchMore();
              }

              if (snapshot.isFetchingMore) {
                return snapshot.toggleLoader();
              }

              final review = snapshot.docs[index].data();
              return ReviewBubble(
                review: review,
              );
            },
          );
        },
      ),
    );
  }
}
