import 'package:flutter/material.dart';
import 'package:nashmi_app/screens/single_offer/single_offer_screen.dart';
import 'package:nashmi_app/utils/app_constants.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/custom_network_image.dart';
import 'package:nashmi_app/widgets/custom_text.dart';

class MoreOfferCard extends StatelessWidget {
  const MoreOfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
             CustomNetworkImage(
              kFakeImage,
              width: 100,
              height: 100,
              onTap: () {
                context.push(const SingleOfferScreen());
              },
              radius: MyTheme.radiusSecondary,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    "هاتف ايفون 15Pro",
                    overFlow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    "فقط بـ 99 دينار",
                    color: context.colorPalette.redB31,
                    overFlow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                  ),
                  const CustomText(
                    "لأول 100 مشتري فقط",
                    overFlow: TextOverflow.ellipsis,
                    fontSize: 12,
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 121,
                    height: 30,
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: context.colorPalette.greyF2F,
                      borderRadius: BorderRadius.circular(MyTheme.radiusPrimary),
                    ),
                    child: const Row(
                      children: [
                        CustomNetworkImage(
                          kFakeImage,
                          width: 20,
                          height: 20,
                          radius: MyTheme.radiusPrimary,
                        ),
                        SizedBox(width: 3),
                        Expanded(
                          child: CustomText(
                            "iSystem Jordan",
                            fontSize: 12,
                            overFlow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ],
        ),
        Divider(color: context.colorPalette.greyF7E)
      ],
    );
  }
}
