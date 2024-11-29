import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nashmi_app/models/category/category_model.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/app_container.dart';
import 'package:nashmi_app/widgets/category_bubble.dart';
import 'package:nashmi_app/widgets/custom_back.dart';
import 'package:nashmi_app/widgets/custom_svg.dart';
import 'package:nashmi_app/widgets/custom_text.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppContainer(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              centerTitle: true,
              leadingWidth: kBarLeadingWith,
              backgroundColor: Colors.transparent,
              leading: const CustomBack(),
              title: InkWell(
                onTap: () {},
                child: const Row(
                  children: [
                    Flexible(
                      child: CustomText(
                        "📍️عمان ، خلدا",
                        fontSize: 16,
                        overFlow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),
                    CustomSvg(MyIcons.arrowDown),
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
                        context.appLocalization.whatDoWehave,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: (MediaQuery.of(context).size.width / 80).toInt(),
                        childAspectRatio: 80 / 110,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        childCount: 20,
                        (context, index) {
                          return CategoryBubble(
                            category: CategoryModel(),
                          );
                        },
                      ),
                    ),
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
