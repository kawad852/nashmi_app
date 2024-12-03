import 'package:flutter/material.dart';
import 'package:nashmi_app/widgets/shimmer/shimmer_loading.dart';

import '../utils/dimensions.dart';

class ProviderShimmer extends StatelessWidget {
  const ProviderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      builder: (context, bubble) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            bubble(
              height: 45,
              width: 45,
              margin: const EdgeInsetsDirectional.only(end: 10),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  bubble(
                    height: kTextShimmerHeight,
                    width: 70,
                    margin: const EdgeInsets.only(top: 5),
                  ),
                  bubble(
                    height: kTextShimmerHeight,
                    width: 120,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
