import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nashmi_app/screens/providers/providers_screen.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/app_container.dart';
import 'package:nashmi_app/widgets/custom_back.dart';
import 'package:nashmi_app/widgets/custom_svg.dart';
import 'package:nashmi_app/widgets/custom_text.dart';

class SingleCategoryScreen extends StatefulWidget {
  const SingleCategoryScreen({super.key});

  @override
  State<SingleCategoryScreen> createState() => _SingleCategoryScreenState();
}

class _SingleCategoryScreenState extends State<SingleCategoryScreen> {
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
                    const SliverToBoxAdapter(
                      child: CustomText(
                        "Category",
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
                          return GestureDetector(
                            onTap: () {
                              context.push(const ProvidersScreen());
                            },
                            child: Container(
                              width: double.infinity,
                              height: 48,
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: context.colorPalette.greyF2F,
                                borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CustomText(
                                      "نجار",
                                      color: context.colorPalette.black1D,
                                      overFlow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20,
                                  )
                                ],
                              ),
                            ),
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
