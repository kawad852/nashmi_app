import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nashmi_app/utils/dimensions.dart';
import 'package:nashmi_app/utils/providers_extension.dart';
import 'package:nashmi_app/widgets/editors/base_editor.dart';

import '../../../alerts/feedback/app_feedback.dart';
import '../../../helper/my_factory.dart';
import '../../../models/review/review_model.dart';
import '../../../network/api_service.dart';
import '../../../network/fire_queries.dart';
import '../../../network/my_collections.dart';
import '../../../network/my_fields.dart';
import '../../../utils/base_extensions.dart';
import '../../../widgets/rating_stars.dart';
import '../../../widgets/stretch_button.dart';

class ReviewSheet extends StatefulWidget {
  final String id;

  const ReviewSheet({
    super.key,
    required this.id,
  });

  @override
  State<ReviewSheet> createState() => _ReviewSheetState();
}

class _ReviewSheetState extends State<ReviewSheet> {
  late ReviewModel _review;

  String get _providerId => widget.id;
  FirebaseFirestore get _firebaseFirestore => FirebaseFirestore.instance;

  void _submit(BuildContext context) {
    ApiService.fetch(
      context,
      callBack: () async {
        final user = context.userProvider.userModel;
        final batch = _firebaseFirestore.batch();
        _review = _review.copyWith(
          id: MyFactory.generateId,
          displayName: user.displayName,
          userId: user.id,
          photoURL: user.photoURL,
        );
        final document = _firebaseFirestore.providers.doc(_providerId).collection(MyCollections.reviews).doc(user.id);
        batch.set(
            document,
            ({
              ..._review.toJson(),
              MyFields.createdAt: FieldValue.serverTimestamp(),
            }));

        await batch.commit();

        if (context.mounted) {
          context.showSnackBar(context.appLocalization.reviewSubmittedMsg);
          Navigator.pop(context, true);
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _review = ReviewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kScreenMargin),
      child: Column(
        children: [
          RatingStars(
            rate: _review.rating,
            onRatingUpdate: (rating) => _review.rating = rating,
            size: 30,
            ignoreGestures: false,
          ),
          BaseEditor(
            hintText: context.appLocalization.comment,
            initialValue: null,
            maxLines: 3,
            required: false,
            padding: const EdgeInsets.symmetric(vertical: 20),
            onChanged: (value) => _review.comment = value,
          ),
          StretchedButton(
            onPressed: () {
              _submit(context);
            },
            child: Text(context.appLocalization.submit),
          ),
        ],
      ),
    );
  }
}
