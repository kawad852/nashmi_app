import 'dart:io' show Platform;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nashmi_app/controllers/map_controller.dart';
import 'package:nashmi_app/helper/launcher_service.dart';
import 'package:nashmi_app/models/provider/provider_model.dart';
import 'package:nashmi_app/models/tag/tag_model.dart';
import 'package:nashmi_app/network/api_service.dart';
import 'package:nashmi_app/network/fire_queries.dart';
import 'package:nashmi_app/network/my_fields.dart';
import 'package:nashmi_app/providers/user_provider.dart';
import 'package:nashmi_app/screens/provider/reviews_screen.dart';
import 'package:nashmi_app/screens/provider/widgets/favorite_button.dart';
import 'package:nashmi_app/screens/provider/widgets/like_builder.dart';
import 'package:nashmi_app/screens/provider/widgets/review_builder.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/dimensions.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/utils/my_images.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/utils/providers_extension.dart';
import 'package:nashmi_app/widgets/custom_future_builder.dart';
import 'package:nashmi_app/widgets/custom_network_image.dart';
import 'package:nashmi_app/widgets/custom_svg.dart';
import 'package:nashmi_app/widgets/custom_text.dart';
import 'package:nashmi_app/widgets/map_bubble.dart';
import 'package:nashmi_app/widgets/nashmi_scaffold.dart';
import 'package:nashmi_app/widgets/rating_stars.dart';
import 'package:nashmi_app/widgets/stretch_button.dart';
import 'package:nashmi_app/widgets/user_selector.dart';

import '../../alerts/errors/app_error_widget.dart';
import '../../models/category/category_model.dart';
import '../../utils/enums.dart';

class ProviderScreen extends StatefulWidget {
  final ProviderModel? provider;
  final String? id;

  const ProviderScreen({
    super.key,
    required this.provider,
    this.id,
  });

  @override
  State<ProviderScreen> createState() => _ProviderScreenState();
}

class _ProviderScreenState extends State<ProviderScreen> {
  late Future<List<dynamic>> _futures;

  UserProvider get _userProvider => context.userProvider;

  void _initialize() {
    _futures = ApiService.build(
      callBack: () async {
        late Future<ProviderModel> providerFuture;
        if (widget.provider != null) {
          providerFuture = Future.value(widget.provider);
        } else {
          providerFuture = FirebaseFirestore.instance.providers.doc(widget.id).get().then((value) => value.data()!);
        }
        final provider = await providerFuture;
        final categoriesFuture = FirebaseFirestore.instance.categories.where(MyFields.id, whereIn: provider.categoryIds).get().then((value) {
          final categories = value.docs.map((e) => e.data()).toList();
          categories.sort((a, b) => (b.mainCategory ? 1 : 0) - (a.mainCategory ? 1 : 0));
          return categories;
        });
        final tagsFuture = FirebaseFirestore.instance.tags.where(MyFields.id, whereIn: provider.tagIds).orderBy(MyFields.createdAt, descending: true).get().then((value) {
          final tags = value.docs.map((e) => e.data()).toList();
          return tags;
        });
        return Future.wait([providerFuture, categoriesFuture, tagsFuture]);
      },
    );
  }

  void _incrementViews() {
    FirebaseFirestore.instance.providers.doc(widget.id ?? widget.provider?.id).update({
      MyFields.totalViews: FieldValue.increment(1),
    });
  }

  @override
  void initState() {
    super.initState();
    _initialize();
    _incrementViews();
  }

  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder(
      future: _futures,
      withBackgroundColor: true,
      onComplete: (context, snapshot) {
        final provider = snapshot.data![0] as ProviderModel;
        final categories = snapshot.data![1] as List<CategoryModel>;
        final tags = snapshot.data![2] as List<TagModel>;
        return UserSelector(builder: (context, user) {
          final isAuthenticated = user != null;
          return NashmiScaffold(
            appBar: AppBar(
              forceMaterialTransparency: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: FavoriteButton(
                    id: provider.id!,
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BottomAppBar(
              color: Colors.transparent,
              child: Row(
                children: [
                  Expanded(
                    child: StretchedButton(
                      onPressed: () {
                        LauncherService.lunch(context, 'tel://${context.getDialCode(provider.providerPhoneCountryCode)}${provider.providerPhoneNum}');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomSvg(MyIcons.calling),
                          const SizedBox(width: 3),
                          Flexible(
                            child: Text(
                              context.appLocalization.callDirectly,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: context.colorPalette.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      if (provider.whatsAppNumber != null)
                        IconButton(
                          onPressed: () {
                            final number = "${context.getDialCode(provider.whatsAppNumberCountryCode)}${provider.whatsAppNumber}";
                            LauncherService.lunch(context, Platform.isAndroid ? "https://wa.me/$number/" : "https://api.whatsapp.com/send?phone=$number");
                          },
                          icon: const CustomSvg(MyIcons.whatsUp),
                        ),
                      if (provider.facebookURL != null)
                        IconButton(
                          onPressed: () {
                            final url = provider.facebookURL!;
                            LauncherService.lunchSocialMedia(
                              context,
                              nativeUrl: url,
                              webUrl: url,
                              type: SocialPlatformEnum.facebook,
                            );
                          },
                          icon: const CustomSvg(MyIcons.facebookCard),
                        ),
                      if (provider.instagramUsername != null)
                        IconButton(
                          onPressed: () {
                            LauncherService.lunchSocialMedia(
                              context,
                              nativeUrl: "instagram://user?username=${provider.instagramUsername}",
                              webUrl: "https://www.instagram.com/${provider.instagramUsername}/",
                              type: SocialPlatformEnum.instagram,
                            );
                          },
                          icon: Image.asset(MyImages.instagram),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            body: ListView(
              padding: const EdgeInsets.symmetric(vertical: kScreenMargin),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomNetworkImage(
                            provider.thumbnail!,
                            width: 86,
                            height: 86,
                            radius: MyTheme.radiusSecondary,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        context.translate(
                                          textEN: provider.nameEn,
                                          textAR: provider.nameAr,
                                        ),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    if (provider.isVerified)
                                      const Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 5),
                                        child: CustomSvg(MyIcons.check),
                                      ),
                                    // const CustomSvg(MyIcons.redStar),
                                  ],
                                ),
                                Text(
                                  categories.map((e) => context.translate(textEN: e.nameEn, textAR: e.nameAr)).join(", "),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: context.colorPalette.grey8F8,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    LikeBuilder(
                                      count: provider.likesCount,
                                      id: provider.id!,
                                    ),
                                    const SizedBox(width: 10),
                                    ReviewBuilder(id: provider.id!),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      if (provider.ratingsCount > 0)
                        Row(
                          children: [
                            RatingStars(
                              rate: provider.avgRating,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "(${provider.ratingsCount})",
                              style: TextStyle(
                                fontSize: 12,
                                color: context.colorPalette.grey8F8,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                context.navigate((context) {
                                  return ReviewsScreen(id: provider.id!);
                                });
                              },
                              child: CustomText(
                                context.appLocalization.viewRatings,
                                fontSize: 12,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      Text(
                        context.translate(
                          textEN: provider.descriptionEn,
                          textAR: provider.descriptionAr,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        direction: Axis.horizontal,
                        children: tags.map((element) {
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
                                child: Text(
                                  context.translate(textEN: element.nameEn, textAR: element.nameAr),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                if (provider.images!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            context.appLocalization.images,
                            style: TextStyle(
                              color: context.colorPalette.red8B0,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 200,
                          child: ListView.separated(
                            separatorBuilder: (context, index) => const SizedBox(width: 10),
                            itemCount: provider.images!.length,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final image = provider.images![index];
                              return CustomNetworkImage(
                                image,
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.appLocalization.addressAndLocation,
                        style: TextStyle(
                          color: context.colorPalette.red8B0,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "${context.translate(textEN: provider.state?.nameEn, textAR: provider.state?.nameAr)}, ${context.translate(textEN: provider.city?.nameEn, textAR: provider.city?.nameAr)}, ${context.translate(textEN: provider.addressEn, textAR: provider.addressAr)}",
                      ),
                      if (isAuthenticated) ...[
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
                            child: SizedBox(
                              height: 90,
                              child: MapBubble(
                                controller: MapController(
                                  context,
                                  lat: provider.geo!.geoPoint!.latitude,
                                  lng: provider.geo!.geoPoint!.longitude,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          );
        });
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
