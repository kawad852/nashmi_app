import 'package:flutter/material.dart';
import 'package:nashmi_app/screens/single_offer/single_offer_screen.dart';
import 'package:nashmi_app/utils/app_constants.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/custom_network_image.dart';
import 'package:nashmi_app/widgets/custom_text.dart';

class OffersCard extends StatelessWidget {
  const OffersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomNetworkImage(
      kFakeImage,
      width: 160,
      height: 230,
      radius: MyTheme.radiusSecondary,
      onTap: () {
        context.push(const SingleOfferScreen());
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
          gradient: const LinearGradient(
            colors: [
              Color(0x00FFFFFF),
              Color(0xFFFFFFFF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Container(
                width: 133,
                height: 30,
                margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: context.colorPalette.white,
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
                        overFlow: TextOverflow.ellipsis,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    "هاتف ايفون 15Pro",
                    maxLines: 1,
                    fontWeight: FontWeight.bold,
                    overFlow: TextOverflow.ellipsis,
                  ),
                  CustomText(
                    "فقط بـ 99 دينار",
                    maxLines: 1,
                    overFlow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                    color: context.colorPalette.redB31,
                  ),
                  const CustomText(
                    "لأول 100 مشتري فقط",
                    maxLines: 1,
                    overFlow: TextOverflow.ellipsis,
                    fontSize: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
