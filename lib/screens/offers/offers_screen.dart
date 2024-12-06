import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nashmi_app/helper/separator.dart';
import 'package:nashmi_app/models/offer_settings/offer_settings_model.dart';
import 'package:nashmi_app/screens/offers/widgets/more_offer_card.dart';
import 'package:nashmi_app/screens/offers/widgets/offers_card.dart';
import 'package:nashmi_app/screens/offers/widgets/offers_nav_bar.dart';
import 'package:nashmi_app/screens/offers/widgets/time_bubble.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/widgets/custom_svg.dart';
import 'package:nashmi_app/widgets/custom_text.dart';
import 'package:nashmi_app/widgets/nashmi_scaffold.dart';
import 'package:provider/provider.dart';

import '../../helper/ui_helper.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  @override
  Widget build(BuildContext context) {
    return Selector<OfferSettingsModel?, OfferSettingsModel?>(
      selector: (context, provider) => provider,
      builder: (context, offer, child) {
        if (offer == null) {
          return const SizedBox.shrink();
        } else if (offer.lunchAt!.isAfter(DateTime.now())) {
          final parts = UiHelper.formatDuration(context, offer.lunchAt!);
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.translate(textEN: offer.contentEn, textAR: offer.contentAr),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    parts.length,
                    (index) {
                      final part = parts[index];
                      return TimeBubble(time: part);
                    },
                  ).separator(const SizedBox(width: 10)).toList(),
                ),
              ],
            ),
          );
        }
        return NashmiScaffold(
          bottomNavigationBar: const OffersNavBar(),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                centerTitle: true,
                leading: IconButton(
                  onPressed: () {},
                  icon: const CustomSvg(MyIcons.menu),
                ),
                title: CustomText(
                  context.appLocalization.nashmiDay,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const CustomSvg(MyIcons.notification),
                  ),
                ],
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CustomText(
                          context.appLocalization.luxuriousOffers,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 230,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(width: 10),
                          itemCount: 10,
                          padding: const EdgeInsetsDirectional.only(top: 10, start: 20, end: 20),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return const OffersCard();
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
                  child: ShrinkWrappingViewport(
                    offset: ViewportOffset.zero(),
                    slivers: [
                      SliverToBoxAdapter(
                        child: CustomText(
                          context.appLocalization.more,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        sliver: SliverList.separated(
                          separatorBuilder: (context, index) => const SizedBox(height: 10),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return const MoreOfferCard();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
