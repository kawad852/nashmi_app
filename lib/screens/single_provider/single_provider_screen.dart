import 'package:flutter/material.dart';
import 'package:nashmi_app/screens/single_provider/widgets/provider_info.dart';
import 'package:nashmi_app/utils/app_constants.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/utils/my_images.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/app_container.dart';
import 'package:nashmi_app/widgets/custom_back.dart';
import 'package:nashmi_app/widgets/custom_network_image.dart';
import 'package:nashmi_app/widgets/custom_svg.dart';
import 'package:nashmi_app/widgets/custom_text.dart';
import 'package:nashmi_app/widgets/rating_bubble.dart';
import 'package:nashmi_app/widgets/stretch_button.dart';

class SingleProviderScreen extends StatefulWidget {
  const SingleProviderScreen({super.key});

  @override
  State<SingleProviderScreen> createState() => _SingleProviderScreenState();
}

class _SingleProviderScreenState extends State<SingleProviderScreen> {
  List<String> fakeData = [
    "دهان اساس",
    "دهان زياتي",
    "ورق جدران",
    "دهان ابواب",
    "دهان اثاث",
    "خلط الوان وتصميم واجهات",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppContainer(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              leadingWidth: kBarLeadingWith,
              leading: const CustomBack(),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: IconButton(
                    onPressed: () {},
                    icon: const CustomSvg(
                      MyIcons.favorite,
                    ),
                  ),
                ),
              ],
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ProviderInfo(),
                    Row(
                      children: [
                        const RatingBubble(
                          rate: 5,
                          ignoreGestures: true,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: CustomText(
                            "(750)",
                            fontSize: 12,
                            color: context.colorPalette.grey8F8,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: CustomText(
                            context.appLocalization.viewRatings,
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    const CustomText(
                      "دهين للمنازل والشقق ، اعمل في مجال الدهان منذ 2013. لدي خبرة في جميع انواع الدهان وقادر على استلام جميع المشاريع في جميع مناطق عمان.",
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      direction: Axis.horizontal,
                      children: fakeData.map((element) {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 34,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
                              decoration: BoxDecoration(
                                color: context.colorPalette.greyF2F,
                                borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
                              ),
                              child: CustomText(
                                element,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomText(
                        context.appLocalization.images,
                        color: context.colorPalette.red8B0,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(width: 10),
                        itemCount: 10,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return const CustomNetworkImage(
                            kFakeImage,
                            width: 200,
                            height: 200,
                            radius: MyTheme.radiusSecondary,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      context.appLocalization.addressAndLocation,
                      color: context.colorPalette.red8B0,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    const CustomText(
                      "عمان ، صويلح ، بالقرب من مركز امن صويلح",
                    ),
                    const CustomNetworkImage(
                      kFakeImage,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: double.infinity,
                      height: 90,
                      radius: MyTheme.radiusSecondary,
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: StretchedButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CustomSvg(MyIcons.calling),
                                const SizedBox(width: 3),
                                Expanded(
                                  child: CustomText(
                                    context.appLocalization.callDirectly,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: context.colorPalette.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const CustomSvg(MyIcons.whatsUp),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const CustomSvg(MyIcons.facebookCard),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(MyImages.instagram),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
