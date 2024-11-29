import 'package:flutter/material.dart';
import 'package:nashmi_app/models/category/category_model.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/dimensions.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/utils/providers_extension.dart';
import 'package:nashmi_app/widgets/category_bubble.dart';
import 'package:nashmi_app/widgets/custom_back.dart';
import 'package:nashmi_app/widgets/custom_svg.dart';
import 'package:nashmi_app/widgets/custom_text.dart';
import 'package:nashmi_app/widgets/fire_builder.dart';
import 'package:nashmi_app/widgets/nashmi_scaffold.dart';

class CategoriesScreen extends StatefulWidget {
  final List<CategoryModel> initialData;

  const CategoriesScreen({
    super.key,
    required this.initialData,
  });

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return FireBuilder(
      initialData: [
        widget.initialData,
      ],
      futures: [
        context.fireProvider.mainCategoriesQuery.get().then((value) => value.docs.map((e) => e.data()).toList()),
      ],
      onComplete: (context, snapshot) {
        final categories = snapshot.data![0] as List<CategoryModel>;
        return NashmiScaffold(
          appBar: AppBar(
            centerTitle: true,
            forceMaterialTransparency: true,
            leadingWidth: kBarLeadingWith,
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
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(30),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: kScreenMargin, bottom: 10),
                  child: Text(
                    context.appLocalization.whatDoWehave,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          child: GridView.builder(
            itemCount: categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemBuilder: (context, index) {
              final category = categories[index];
              return CategoryBubble(
                category: category,
              );
            },
          ),
        );
      },
    );
  }
}
