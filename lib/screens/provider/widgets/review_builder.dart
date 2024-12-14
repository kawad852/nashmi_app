import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nashmi_app/models/review/review_model.dart';
import 'package:nashmi_app/network/fire_queries.dart';
import 'package:nashmi_app/screens/provider/widgets/review_sheet.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/utils/providers_extension.dart';
import 'package:nashmi_app/widgets/custom_svg.dart';

import '../../../network/my_collections.dart';
import '../../../widgets/custom_stream_builder.dart';
import '../../../widgets/shimmer/shimmer_loading.dart';

class ReviewBuilder extends StatefulWidget {
  final String id;

  const ReviewBuilder({
    super.key,
    required this.id,
  });

  @override
  State<ReviewBuilder> createState() => _ReviewBuilderState();
}

class _ReviewBuilderState extends State<ReviewBuilder> {
  late Stream<DocumentSnapshot<ReviewModel>> _stream;

  String get _providerId => widget.id;
  DocumentReference<ReviewModel> get _reviewDocRef =>
      FirebaseFirestore.instance.providers.doc(_providerId).collection(MyCollections.reviews).doc(context.userProvider.userUid).withConverter<ReviewModel>(
            fromFirestore: (snapshot, _) => ReviewModel.fromJson(snapshot.data()!),
            toFirestore: (snapshot, _) => snapshot.toJson(),
          );

  void _initialize() {
    _stream = _reviewDocRef.snapshots();
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return CustomStreamBuilder(
      stream: _stream,
      onLoading: () => ShimmerLoading(
        builder: (context, bubble) {
          return bubble(
            height: 40,
            width: 120,
          );
        },
      ),
      onError: (error) => const SizedBox.shrink(),
      onComplete: (context, snapshot) {
        final hasReview = snapshot.data!.exists;
        if (hasReview) {
          return const SizedBox.shrink();
        }

        return FadeIn(
          child: GestureDetector(
            onTap: () {
              context.userProvider.handleGuest(
                context,
                action: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: context.colorScheme.surface,
                    constraints: const BoxConstraints(maxHeight: 250),
                    builder: (context) {
                      return ReviewSheet(
                        id: _providerId,
                      );
                    },
                  );
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
              decoration: BoxDecoration(
                color: context.colorPalette.greyF2F,
                borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CustomSvg(MyIcons.starEdge),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      context.appLocalization.addYourRating,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: context.colorPalette.black3F3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
