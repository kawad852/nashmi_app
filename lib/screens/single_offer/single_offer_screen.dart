import 'package:flutter/material.dart';
import 'package:nashmi_app/screens/single_offer/widgets/offer_bar.dart';
import 'package:nashmi_app/screens/single_offer/widgets/offer_detalis.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/utils/my_images.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/custom_back.dart';
import 'package:nashmi_app/widgets/custom_svg.dart';
import 'package:nashmi_app/widgets/custom_text.dart';
import 'package:nashmi_app/widgets/stretch_button.dart';

class SingleOfferScreen extends StatefulWidget {
  const SingleOfferScreen({super.key});

  @override
  State<SingleOfferScreen> createState() => _SingleOfferScreenState();
}

class _SingleOfferScreenState extends State<SingleOfferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            collapsedHeight: 290,
            leadingWidth: kBarLeadingWith,
            leading: CustomBack(
              color: context.colorPalette.white,
            ),
            flexibleSpace: const OfferBar(),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: CustomText(
                          "شاشة سامسونج 65’",
                          overFlow: TextOverflow.ellipsis,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomText(
                        "${context.appLocalization.watchItNow} 1500",
                        fontSize: 14,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const CustomText(
                        "فقط ب ",
                        fontWeight: FontWeight.bold,
                      ),
                      CustomText(
                        "5 دنانير ",
                        color: context.colorPalette.redB31,
                        fontWeight: FontWeight.bold,
                      ),
                      const CustomText(
                        "بدلا من ",
                        fontWeight: FontWeight.bold,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(MyImages.line),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        child: const CustomText(
                          "350",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const CustomText(
                        "دينار",
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomText(
                    context.appLocalization.offerDetails,
                    color: context.colorPalette.red8B0,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  const CustomText('''
احصل على شاشة سامسونج سمارت 65’ بوصة فقط بـ 5 دنانير
بدلاً من 350 دينار تدعم جودة العرض 4k 
العرض فقط لأول 20 شخص.
العرض داخل المحل فقط ( فرع خلدا ).  '''),
                  StretchedButton(
                    onPressed: () {},
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        const CustomSvg(MyIcons.scan),
                        const SizedBox(width: 5),
                        Expanded(
                          child: CustomText(
                            context.appLocalization.scanQR,
                            fontSize: 16,
                            color: context.colorPalette.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
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
                  const OfferDetalis(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: StretchedButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                const CustomSvg(MyIcons.locationOffer),
                                const SizedBox(width: 5),
                                Expanded(
                                  child: CustomText(
                                    context.appLocalization.catchOffer,
                                    fontSize: 16,
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.bold,
                                    color: context.colorPalette.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: StretchedButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                const CustomSvg(MyIcons.share),
                                const SizedBox(width: 5),
                                Expanded(
                                  child: CustomText(
                                    context.appLocalization.share,
                                    textAlign: TextAlign.center,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: context.colorPalette.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
