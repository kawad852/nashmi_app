import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nashmi_app/screens/providers/filter_screen.dart';
import 'package:nashmi_app/screens/providers/widgets/provider_card.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/custom_back.dart';
import 'package:nashmi_app/widgets/custom_svg.dart';
import 'package:nashmi_app/widgets/custom_text.dart';
import 'package:nashmi_app/widgets/editors/base_editor.dart';
import 'package:nashmi_app/widgets/nashmi_scaffold.dart';

class ProvidersScreen extends StatefulWidget {
  const ProvidersScreen({super.key});

  @override
  State<ProvidersScreen> createState() => _ProvidersScreenState();
}

class _ProvidersScreenState extends State<ProvidersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NashmiScaffold(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              centerTitle: true,
              leadingWidth: kBarLeadingWith,
              collapsedHeight: 100,
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
              flexibleSpace: Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Row(
                    children: [
                      Expanded(
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
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          context.push(const FilterScreen());
                        },
                        child: Container(
                          width: 48,
                          height: 48,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: context.colorPalette.greyF2F,
                            borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
                          ),
                          child: const CustomSvg(MyIcons.filter),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverToBoxAdapter(
                child: ShrinkWrappingViewport(
                  offset: ViewportOffset.zero(),
                  slivers: [
                    const SliverPadding(
                      padding: EdgeInsets.only(top: 5),
                      sliver: SliverToBoxAdapter(
                        child: CustomText(
                          "دهين",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      sliver: SliverList.separated(
                        separatorBuilder: (context, index) => const SizedBox(height: 10),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return const ProviderCard();
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
