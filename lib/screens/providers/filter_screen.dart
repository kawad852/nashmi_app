import 'package:flutter/material.dart';
import 'package:nashmi_app/screens/providers/widgets/filter_bubble.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/app_container.dart';
import 'package:nashmi_app/widgets/custom_back.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppContainer(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              pinned: true,
              leadingWidth: kBarLeadingWith,
              backgroundColor: Colors.transparent,
              leading: CustomBack(),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  height: 194,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: context.colorPalette.greyF2F,
                    borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FilterBubble(
                        icon: MyIcons.offersSelect,
                        title: context.appLocalization.mostRated,
                        onTap: () {},
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: FilterBubble(
                          icon: MyIcons.like,
                          title: context.appLocalization.mostLikes,
                          onTap: () {},
                        ),
                      ),
                      FilterBubble(
                        icon: MyIcons.location,
                        title: context.appLocalization.nearestDistance,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
