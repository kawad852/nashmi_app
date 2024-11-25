import 'package:flutter/material.dart';
import 'package:nashmi_app/screens/single_provider/single_provider_screen.dart';
import 'package:nashmi_app/utils/app_constants.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/custom_network_image.dart';
import 'package:nashmi_app/widgets/custom_svg.dart';
import 'package:nashmi_app/widgets/custom_text.dart';
import 'package:nashmi_app/widgets/rating_bubble.dart';

class ProviderCard extends StatelessWidget {
  const ProviderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(const SingleProviderScreen());
      },
      child: Container(
        width: double.infinity,
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: context.colorPalette.greyF2F,
          borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
        ),
        child: Row(
          children: [
            const CustomNetworkImage(
              kFakeImage,
              width: 60,
              height: 60,
              radius: MyTheme.radiusSecondary,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                    "احمد محمد",
                    overFlow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    "عمان ، صويلح",
                    color: context.colorPalette.grey8F8,
                    overFlow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      const RatingBubble(
                        rate: 3,
                        ignoreGestures: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: CustomText(
                          "(450)",
                          fontSize: 12,
                          color: context.colorPalette.grey8F8,
                        ),
                      ),
                      const CustomSvg(MyIcons.like),
                      const SizedBox(width: 3),
                      Expanded(
                        child: CustomText(
                          "1.3 الف ${context.appLocalization.like}",
                          fontSize: 12,
                          overFlow: TextOverflow.ellipsis,
                          color: context.colorPalette.grey8F8,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 15,
            )
          ],
        ),
      ),
    );
  }
}
