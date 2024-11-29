import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nashmi_app/alerts/errors/app_error_widget.dart';
import 'package:nashmi_app/models/category/category_model.dart';
import 'package:nashmi_app/network/fire_queries.dart';
import 'package:nashmi_app/network/my_fields.dart';
import 'package:nashmi_app/screens/categories/categories_screen.dart';
import 'package:nashmi_app/screens/home/widgets/my_slider.dart';
import 'package:nashmi_app/utils/app_constants.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/category_bubble.dart';
import 'package:nashmi_app/widgets/custom_future_builder.dart';
import 'package:nashmi_app/widgets/custom_network_image.dart';
import 'package:nashmi_app/widgets/custom_svg.dart';
import 'package:nashmi_app/widgets/custom_text.dart';
import 'package:nashmi_app/widgets/editors/base_editor.dart';

import '../../network/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<dynamic>> _futures;

  Future<List<dynamic>> _fetchFutures() {
    return ApiService.build(
      callBack: () async {
        final categoriesFuture = FirebaseFirestore.instance.categories
            .where(MyFields.published, isEqualTo: true)
            .where(MyFields.mainCategory, isEqualTo: true)
            .orderBy(MyFields.order, descending: false)
            .orderBy(MyFields.createdAt, descending: true)
            .limit(8)
            .get();
        return Future.wait([categoriesFuture]);
      },
    );
  }

  void _initialize() {
    _futures = _fetchFutures();
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
      onComplete: (context, snapshot) {
        final categoriesQuerySnapshot = (snapshot.data![0] as QuerySnapshot<CategoryModel>).docs;
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              leadingWidth: double.infinity,
              collapsedHeight: 100,
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
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: BaseEditor(
                    hintText: context.appLocalization.whatAreYouLooking,
                    hintStyle: TextStyle(
                      color: context.colorPalette.black1D,
                      fontSize: 14,
                    ),
                    prefixIcon: const IconButton(
                      onPressed: null,
                      icon: CustomSvg(MyIcons.search),
                    ),
                    onChanged: (value) {},
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MySlider(),
                    Row(
                      children: [
                        Expanded(
                          child: CustomNetworkImage(
                            kFakeImage,
                            width: context.mediaQuery.width * 0.5,
                            height: 100,
                            radius: MyTheme.radiusSecondary,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomNetworkImage(
                            kFakeImage,
                            width: context.mediaQuery.width * 0.5,
                            height: 100,
                            radius: MyTheme.radiusSecondary,
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
                              context.push(const CategoriesScreen());
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
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                delegate: SliverChildBuilderDelegate(
                  childCount: categoriesQuerySnapshot.length,
                  (context, index) {
                    final category = categoriesQuerySnapshot[index].data();
                    return CategoryBubble(
                      category: category,
                    );
                  },
                ),
              ),
            ),
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
                      itemCount: 10,
                      padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return const CustomNetworkImage(
                          kFakeImage,
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
            setState(() {});
          },
        );
      },
    );
  }
}
