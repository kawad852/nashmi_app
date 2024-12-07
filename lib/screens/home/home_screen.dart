import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nashmi_app/alerts/errors/app_error_widget.dart';
import 'package:nashmi_app/helper/ui_helper.dart';
import 'package:nashmi_app/models/ad/ad_model.dart';
import 'package:nashmi_app/models/category/category_model.dart';
import 'package:nashmi_app/models/offer_settings/offer_settings_model.dart';
import 'package:nashmi_app/models/sponsor/sponsor_model.dart';
import 'package:nashmi_app/network/api_service.dart';
import 'package:nashmi_app/network/fire_queries.dart';
import 'package:nashmi_app/network/my_fields.dart';
import 'package:nashmi_app/providers/providers_search_screen.dart';
import 'package:nashmi_app/screens/category/categories_screen.dart';
import 'package:nashmi_app/screens/home/widgets/ads_carousel.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/utils/my_images.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/utils/providers_extension.dart';
import 'package:nashmi_app/widgets/category_bubble.dart';
import 'package:nashmi_app/widgets/custom_future_builder.dart';
import 'package:nashmi_app/widgets/custom_network_image.dart';
import 'package:nashmi_app/widgets/custom_svg.dart';
import 'package:nashmi_app/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<dynamic>> _futures;

  void _initialize() {
    _futures = ApiService.build(
      callBack: () async {
        final categoriesFuture = context.fireProvider.mainCategoriesQuery.limit(8).get().then((value) => value.docs.map((e) => e.data()).toList());
        final adsFuture = FirebaseFirestore.instance.ads.orderBy(MyFields.createdAt, descending: true).get().then((value) => value.docs.map((e) => e.data()).toList());
        final sponsorsFuture =
            FirebaseFirestore.instance.sponsors.orderBy(MyFields.createdAt, descending: true).get().then((value) => value.docs.map((e) => e.data()).toList());
        return Future.wait([categoriesFuture, adsFuture, sponsorsFuture]);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder(
      future: _futures,
      withBackgroundColor: true,
      onComplete: (context, snapshot) {
        final categories = snapshot.data![0] as List<CategoryModel>;
        final ads = snapshot.data![1] as List<AdModel>;
        final sponsors = snapshot.data![2] as List<SponsorModel>;
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              leadingWidth: double.infinity,
              collapsedHeight: 110,
              leading: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    CustomText(
                      "${context.appLocalization.helloDear} 👋, ",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    Expanded(
                      child: CustomText(
                        "صهيب البكار",
                        overFlow: TextOverflow.ellipsis,
                        fontSize: 16,
                        color: context.colorPalette.redB31,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Row(
                        children: [
                          CustomText(
                            "📍️عمان ، خلدا",
                            fontSize: 16,
                            overFlow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(width: 5),
                          CustomSvg(MyIcons.arrowDown),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              flexibleSpace: Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 10),
                  child: const ProvidersSearchScreen(),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (ads.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: AdsCarousel(
                          ads: ads,
                        ),
                      ),
                    Row(
                      children: [
                        Expanded(
                          child: Selector<OfferSettingsModel?, OfferSettingsModel?>(
                            selector: (context, provider) => provider,
                            builder: (context, offer, child) {
                              final style = TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: context.colorPalette.white,
                              );
                              return Stack(
                                alignment: AlignmentDirectional.bottomEnd,
                                children: [
                                  Image.asset(
                                    MyImages.instagram,
                                    height: 100,
                                  ),
                                  if (offer != null)
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          context.appLocalization.startAfter,
                                          style: style,
                                        ),
                                        Text(
                                          UiHelper.formatDuration(context, offer.lunchAt!).join(':'),
                                          style: style,
                                        ),
                                      ],
                                    ),
                                ],
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Image.asset(
                            MyImages.instagram,
                            height: 100,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomText(
                              context.appLocalization.whatDoWehave,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.navigate((context) {
                                return const CategoriesScreen();
                              });
                            },
                            child: Row(
                              children: [
                                CustomText(
                                  context.appLocalization.more,
                                  fontWeight: FontWeight.bold,
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                )
                              ],
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
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                delegate: SliverChildBuilderDelegate(
                  childCount: categories.length,
                  (context, index) {
                    final category = categories[index];
                    return CategoryBubble(
                      category: category,
                    );
                  },
                ),
              ),
            ),
            if (sponsors.isNotEmpty)
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 20, bottom: 10),
                      child: CustomText(
                        context.appLocalization.officialSponsors,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 90,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(width: 10),
                        itemCount: sponsors.length,
                        padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final sponsor = sponsors[index];
                          return CustomNetworkImage(
                            sponsor.logo!,
                            width: 80,
                            height: 80,
                            radius: MyTheme.radiusSecondary,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
          ],
        );
      },
      onError: (error) {
        return AppErrorWidget(
          error: error,
          onRetry: () {
            setState(() {
              _initialize();
            });
          },
        );
      },
    );
  }
}
