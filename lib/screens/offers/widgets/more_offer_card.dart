import 'package:flutter/material.dart';
import 'package:nashmi_app/models/offer/offer_model.dart';
import 'package:nashmi_app/screens/offers/offer_screen.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/custom_network_image.dart';
import 'package:nashmi_app/widgets/custom_text.dart';

class MoreOfferCard extends StatelessWidget {
  final OfferModel offer;

  const MoreOfferCard({
    super.key,
    required this.offer,
  });

  @override
  Widget build(BuildContext context) {
    final provider = offer.provider!;
    return ClipRRect(
      borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () {},
          child: Column(
            children: [
              Row(
                children: [
                  CustomNetworkImage(
                    offer.thumbnail!,
                    width: 100,
                    height: 100,
                    onTap: () {
                      context.navigate(
                        (context) => OfferScreen(
                          id: offer.id!,
                        ),
                      );
                    },
                    radius: MyTheme.radiusSecondary,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          context.translate(textEN: offer.nameEn, textAR: offer.nameAr),
                          overFlow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          context.appLocalization.offerPriceLabel(context.currency, offer.offerPrice!),
                          color: context.colorPalette.red018,
                          overFlow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          context.appLocalization.purchaseLimitLabel(offer.purchaseLimit!),
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
            ],
          ),
        ),
      ),
    );
  }
}
