import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/widgets/custom_svg.dart';

class RatingStars extends StatelessWidget {
  final double? rate;
  final bool ignoreGestures;
  final void Function(double)? onRatingUpdate;
  final double size;

  const RatingStars({
    super.key,
    this.rate,
    this.ignoreGestures = true,
    this.onRatingUpdate,
    this.size = 15,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rate ?? 1,
      minRating: 1,
      unratedColor: context.colorPalette.greyA1A,
      direction: Axis.horizontal,
      allowHalfRating: true,
      ignoreGestures: ignoreGestures,
      itemSize: size,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 2),
      itemBuilder: (context, _) => const CustomSvg(MyIcons.star),
      onRatingUpdate: onRatingUpdate ??
          (rating) {
            debugPrint(rating.toString());
          },
    );
  }
}
