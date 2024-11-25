import 'package:flutter/material.dart';
import 'package:nashmi_app/utils/app_constants.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/custom_network_image.dart';
import 'package:nashmi_app/widgets/custom_svg.dart';
import 'package:nashmi_app/widgets/custom_text.dart';

class ProviderInfo extends StatelessWidget {
  const ProviderInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomNetworkImage(
          kFakeImage,
          width: 86,
          height: 86,
          radius: MyTheme.radiusSecondary,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Flexible(
                    child: CustomText(
                      "احمد محمد",
                      overFlow: TextOverflow.ellipsis,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: CustomSvg(MyIcons.check),
                  ),
                  CustomSvg(MyIcons.redStar),
                ],
              ),
              CustomText(
                "صيانة منازل، دهين",
                overFlow: TextOverflow.ellipsis,
                color: context.colorPalette.grey8F8,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 98,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: context.colorPalette.greyF2F,
                        borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
                      ),
                      child: Row(
                        children: [
                          const CustomSvg(MyIcons.emptyLike),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: CustomText(
                              context.appLocalization.like,
                            ),
                          ),
                          Expanded(
                            child: CustomText(
                              "827",
                              overFlow: TextOverflow.ellipsis,
                              fontSize: 12,
                              color: context.colorPalette.grey8F8,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: context.colorPalette.greyF2F,
                          borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
                        ),
                        child: Row(
                          children: [
                            const CustomSvg(MyIcons.starEdge),
                            const SizedBox(width: 6),
                            Expanded(
                              child: CustomText(
                                context.appLocalization.addYourRating,
                                textAlign: TextAlign.center,
                                color: context.colorPalette.black3F3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
