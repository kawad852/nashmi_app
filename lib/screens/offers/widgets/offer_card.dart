import 'package:flutter/material.dart';
import 'package:nashmi_app/models/offer/offer_model.dart';
import 'package:nashmi_app/screens/offers/offer_screen.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/custom_network_image.dart';
import 'package:nashmi_app/widgets/custom_text.dart';

class OfferCard extends StatelessWidget {
  final OfferModel offer;

  const OfferCard({
    super.key,
    required this.offer,
  });

  @override
  Widget build(BuildContext context) {
    final provider = offer.provider!;
    return CustomNetworkImage(
      offer.thumbnail!,
      width: 160,
      height: 230,
      radius: MyTheme.radiusSecondary,
      onTap: () {
        context.navigate(
          (context) => OfferScreen(
            id: offer.id!,
          ),
        );
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
                child: Row(
                  children: [
                    CustomNetworkImage(
                      provider.thumbnail!,
                      width: 20,
                      height: 20,
                      radius: MyTheme.radiusPrimary,
                    ),
                    const SizedBox(width: 3),
                    Expanded(
                      child: CustomText(
                        context.translate(textEN: provider.nameEn, textAR: provider.nameAr),
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
                  CustomText(
                    context.translate(textEN: offer.nameEn, textAR: offer.nameAr),
                    maxLines: 1,
                    fontWeight: FontWeight.bold,
                    overFlow: TextOverflow.ellipsis,
                  ),
                  CustomText(
                    context.appLocalization.offerPriceLabel(context.currency, offer.offerPrice!),
                    maxLines: 1,
                    overFlow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                    color: context.colorPalette.red018,
                  ),
                  CustomText(
                    context.appLocalization.purchaseLimitLabel(offer.purchaseLimit!),
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
