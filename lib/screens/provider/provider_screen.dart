import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nashmi_app/controllers/map_controller.dart';
import 'package:nashmi_app/models/provider/provider_model.dart';
import 'package:nashmi_app/models/tag/tag_model.dart';
import 'package:nashmi_app/network/fire_queries.dart';
import 'package:nashmi_app/network/my_fields.dart';
import 'package:nashmi_app/screens/provider/widgets/favorite_button.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/dimensions.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/utils/my_images.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/custom_network_image.dart';
import 'package:nashmi_app/widgets/custom_svg.dart';
import 'package:nashmi_app/widgets/custom_text.dart';
import 'package:nashmi_app/widgets/fire_builder.dart';
import 'package:nashmi_app/widgets/map_bubble.dart';
import 'package:nashmi_app/widgets/nashmi_scaffold.dart';
import 'package:nashmi_app/widgets/rating_bubble.dart';
import 'package:nashmi_app/widgets/stretch_button.dart';

import '../../models/category/category_model.dart';

class MyObject {
  final String name;
  final bool isActive;

  MyObject(this.name, this.isActive);
}

class ProviderScreen extends StatefulWidget {
  final ProviderModel provider;

  const ProviderScreen({
    super.key,
    required this.provider,
  });

  @override
  State<ProviderScreen> createState() => _ProviderScreenState();
}

class _ProviderScreenState extends State<ProviderScreen> {
  ProviderModel get _provider => widget.provider;

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
    return FireBuilder(
      futures: [
        FirebaseFirestore.instance.categories.where(MyFields.id, whereIn: _provider.categoryIds).get().then((value) {
          final categories = value.docs.map((e) => e.data()).toList();
          categories.sort((a, b) => (b.mainCategory ? 1 : 0) - (a.mainCategory ? 1 : 0));
          return categories;
        }),
        FirebaseFirestore.instance.tags.where(MyFields.id, whereIn: _provider.tagIds).orderBy(MyFields.createdAt, descending: true).get().then((value) {
          final tags = value.docs.map((e) => e.data()).toList();
          return tags;
        }),
      ],
      onComplete: (context, snapshot) {
        final categories = snapshot.data![0] as List<CategoryModel>;
        final tags = snapshot.data![1] as List<TagModel>;
        return NashmiScaffold(
          bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            child: Row(
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
          ),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                backgroundColor: Colors.transparent,
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: FavoriteButton(
                      id: _provider.id!,
                    ),
                  ),
                ],
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: kScreenMargin),
                sliver: SliverList.list(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CustomNetworkImage(
                                _provider.thumbnail!,
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
                                          child: CustomText(
                                            context.translate(
                                              textEN: _provider.nameEn,
                                              textAR: _provider.nameAr,
                                            ),
                                            overFlow: TextOverflow.ellipsis,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 5),
                                          child: CustomSvg(MyIcons.check),
                                        ),
                                        const CustomSvg(MyIcons.redStar),
                                      ],
                                    ),
                                    Text(
                                      categories.map((e) => context.translate(textEN: e.nameEn, textAR: e.nameAr)).join(", "),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: context.colorPalette.grey8F8,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            width: 98,
                                            margin: const EdgeInsets.only(top: 5),
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
                                                    child: Text(
                                                      context.appLocalization.addYourRating,
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        color: context.colorPalette.black3F3,
                                                      ),
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
                          ),
                          Row(
                            children: [
                              RatingBubble(
                                rate: _provider.avgRating,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: CustomText(
                                  "(${_provider.ratingsCount})",
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
                          Text(
                            context.translate(
                              textEN: _provider.descriptionEn,
                              textAR: _provider.descriptionAr,
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
                    if (_provider.images!.isNotEmpty)
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
                                itemCount: _provider.images!.length,
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final image = _provider.images![index];
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
                            "${context.translate(textEN: _provider.state?.nameEn, textAR: _provider.state?.nameAr)}, ${context.translate(textEN: _provider.city?.nameEn, textAR: _provider.city?.nameAr)}, ${context.translate(textEN: _provider.addressEn, textAR: _provider.addressAr)}",
                          ),
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
                                    lat: _provider.latitude,
                                    lng: _provider.longitude,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
