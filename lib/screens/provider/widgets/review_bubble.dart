import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/review/review_model.dart';
import '../../../utils/base_extensions.dart';
import '../../../widgets/rating_stars.dart';

class ReviewBubble extends StatelessWidget {
  final ReviewModel review;

  const ReviewBubble({
    super.key,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorPalette.greyF2F,
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        title: Row(
          children: [
            if (review.displayName != null)
              Expanded(
                child: Text(
                  review.displayName!,
                  style: context.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: RatingStars(
                rate: review.rating,
              ),
            ),
          ],
        ),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: review.comment != null
                  ? Text(
                      review.comment ?? "-",
                      style: context.textTheme.bodyLarge,
                    )
                  : const SizedBox.shrink(),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 4),
              child: Text(
                DateFormat.yMMMd().format(review.createdAt!),
                style: context.textTheme.labelSmall!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
