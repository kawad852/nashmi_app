import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nashmi_app/alerts/errors/app_error_widget.dart';
import 'package:nashmi_app/helper/launcher_service.dart';
import 'package:nashmi_app/models/ad/ad_model.dart';
import 'package:nashmi_app/models/category/category_model.dart';
import 'package:nashmi_app/models/sponsor/sponsor_model.dart';
import 'package:nashmi_app/network/api_service.dart';
import 'package:nashmi_app/network/fire_queries.dart';
import 'package:nashmi_app/network/my_fields.dart';
import 'package:nashmi_app/providers/providers_search_screen.dart';
import 'package:nashmi_app/screens/category/categories_screen.dart';
import 'package:nashmi_app/screens/contact/contact_screen.dart';
import 'package:nashmi_app/screens/home/widgets/ads_carousel.dart';
import 'package:nashmi_app/screens/offers/offer_settings_selector.dart';
import 'package:nashmi_app/screens/offers/offers_screen.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/dimensions.dart';
import 'package:nashmi_app/utils/enums.dart';
import 'package:nashmi_app/utils/my_images.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/utils/providers_extension.dart';
import 'package:nashmi_app/widgets/area_button.dart';
import 'package:nashmi_app/widgets/category_bubble.dart';
import 'package:nashmi_app/widgets/custom_future_builder.dart';
import 'package:nashmi_app/widgets/custom_network_image.dart';
import 'package:nashmi_app/widgets/custom_text.dart';
import 'package:nashmi_app/widgets/time_widget.dart';
import 'package:nashmi_app/widgets/user_selector.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {
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
    super.build(context);
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
                    Text(
                      "${context.appLocalization.helloDear} 👋 ",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: UserSelector(
                        builder: (context, user) {
                          if (user?.displayName == null) {
                            return const SizedBox.shrink();
                          }
                          return Text(
                            user!.displayName!,
                            style: TextStyle(
                              fontSize: 16,
                              color: context.colorPalette.red018,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          );
                        },
                      ),
                    ),
                    const AreaButton(),
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
                    SizedBox(
                      child: Row(
                        children: [
                          Expanded(
                            child: OfferSettingsSelector(
                              builder: (context, offer, child) {
                                final style = TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: context.colorPalette.white,
                                );
                                return GestureDetector(
                                  onTap: () {
                                    context.userProvider.handleGuest(
                                      context,
                                      action: () {
                                        context.navigate((context) {
                                          return const OffersScreen();
                                        });
                                      },
                                    );
                                  },
                                  child: Stack(
                                    alignment: AlignmentDirectional.bottomEnd,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          MyImages.nashmiDay,
                                          height: 100,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      if (offer != null && offer.startTime != null && offer.endTime != null)
                                        Builder(
                                          builder: (context) {
                                            String? title;
                                            DateTime? time;
                                            if (offer.startTime!.isAfter(DateTime.now())) {
                                              title = context.appLocalization.startAfter;
                                              time = offer.startTime!;
                                            } else if (offer.endTime!.isAfter(DateTime.now())) {
                                              title = context.appLocalization.endAfter;
                                              time = offer.endTime!;
                                            }
                                            return Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: ConstrainedBox(
                                                constraints: const BoxConstraints(maxWidth: 90),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    if (title != null)
                                                      Text(
                                                        title,
                                                        style: style,
                                                        textAlign: TextAlign.center,
                                                      ),
                                                    if (time != null)
                                                      TimeWidget(
                                                        startTime: time,
                                                        onEnd: () {
                                                          setState(() {});
                                                        },
                                                        builder: (part) {
                                                          return Text(
                                                            part,
                                                            style: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              color: context.colorPalette.white,
                                                            ),
                                                            textDirection: TextDirection.ltr,
                                                          );
                                                        },
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                context.userProvider.handleGuest(
                                  context,
                                  action: () {
                                    context.navigate((context) {
                                      return const ContactScreen(contactType: ContactType.join);
                                    });
                                  },
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  MyImages.joinNashmi,
                                  height: 100,
                                  width: double.infinity,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 0.9,
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
                      height: 80,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(width: 10),
                        itemCount: sponsors.length,
                        padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final sponsor = sponsors[index];
                          return CustomNetworkImage(
                            onTap: () {
                              LauncherService.lunch(context, sponsor.url!);
                            },
                            sponsor.logo!,
                            width: 80,
                            radius: MyTheme.radiusSecondary,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            const SliverPadding(
              padding: EdgeInsets.only(bottom: kScreenMargin),
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

  @override
  bool get wantKeepAlive => true;
}
