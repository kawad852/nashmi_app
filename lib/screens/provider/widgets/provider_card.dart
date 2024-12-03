import 'package:flutter/material.dart';
import 'package:nashmi_app/models/provider/provider_model.dart';
import 'package:nashmi_app/screens/provider/provider_screen.dart';
import 'package:nashmi_app/screens/provider/widgets/favorite_button.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/custom_network_image.dart';
import 'package:nashmi_app/widgets/custom_svg.dart';
import 'package:nashmi_app/widgets/custom_text.dart';
import 'package:nashmi_app/widgets/rating_bubble.dart';

class ProviderCard extends StatelessWidget {
  final ProviderModel provider;
  final bool showFav;

  const ProviderCard({
    super.key,
    required this.provider,
    this.showFav = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.navigate((context) {
          return ProviderScreen(
            provider: provider,
          );
        });
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
            CustomNetworkImage(
              provider.thumbnail!,
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
                  Text(
                    context.translate(textEN: provider.nameEn, textAR: provider.nameAr),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "${context.translate(textEN: provider.state!.nameEn!, textAR: provider.state!.nameAr!)}, ${context.translate(textEN: provider.city!.nameEn!, textAR: provider.city!.nameAr!)}",
                    style: TextStyle(
                      color: context.colorPalette.grey8F8,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      RatingBubble(
                        rate: provider.avgRating,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: CustomText(
                          "(${provider.ratingsCount.round()})",
                          fontSize: 12,
                          color: context.colorPalette.grey8F8,
                        ),
                      ),
                      const CustomSvg(MyIcons.like),
                      const SizedBox(width: 3),
                      Expanded(
                        child: CustomText(
                          "${provider.likesCount.round()} ${context.appLocalization.like}",
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
            if (showFav)
              FavoriteButton(id: provider.id!)
            else
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
