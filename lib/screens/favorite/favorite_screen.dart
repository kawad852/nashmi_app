import 'package:flutter/material.dart';
import 'package:nashmi_app/models/provider/provider_model.dart';
import 'package:nashmi_app/screens/provider/provider_screen.dart';
import 'package:nashmi_app/utils/app_constants.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/custom_network_image.dart';
import 'package:nashmi_app/widgets/custom_svg.dart';
import 'package:nashmi_app/widgets/custom_text.dart';
import 'package:nashmi_app/widgets/rating_bubble.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          centerTitle: true,
          title: CustomText(
            context.appLocalization.favoritesList,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverList.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: 10,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.navigate((context) {
                    return ProviderScreen(
                      provider: ProviderModel(),
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
                      IconButton(
                        onPressed: () {},
                        icon: const CustomSvg(MyIcons.favSelect),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
