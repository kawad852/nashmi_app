import 'package:flutter/material.dart';
import 'package:nashmi_app/models/category/category_model.dart';
import 'package:nashmi_app/screens/categories/categories_screen.dart';
import 'package:nashmi_app/screens/home/widgets/my_slider.dart';
import 'package:nashmi_app/utils/app_constants.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/utils/providers_extension.dart';
import 'package:nashmi_app/widgets/category_bubble.dart';
import 'package:nashmi_app/widgets/custom_network_image.dart';
import 'package:nashmi_app/widgets/custom_svg.dart';
import 'package:nashmi_app/widgets/custom_text.dart';
import 'package:nashmi_app/widgets/editors/base_editor.dart';
import 'package:nashmi_app/widgets/fire_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FireBuilder(
      futures: [
        context.fireProvider.mainCategoriesQuery.limit(8).get().then((value) => value.docs.map((e) => e.data()).toList()),
      ],
      onComplete: (context, snapshot) {
        final categories = snapshot.data![0] as List<CategoryModel>;
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
                      color: context.colorPalette.blackD1D,
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
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
    );
  }
}
