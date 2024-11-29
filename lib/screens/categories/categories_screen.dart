import 'package:flutter/material.dart';
import 'package:nashmi_app/models/category/category_model.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/dimensions.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/utils/providers_extension.dart';
import 'package:nashmi_app/widgets/category_bubble.dart';
import 'package:nashmi_app/widgets/custom_svg.dart';
import 'package:nashmi_app/widgets/fire_paginator/fire_paginator.dart';
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
    return NashmiScaffold(
      appBar: AppBar(
        centerTitle: true,
        forceMaterialTransparency: true,
        title: InkWell(
          onTap: () {},
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "📍️عمان ، خلدا",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
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
      child: FirePaginator(
        pageSize: 30,
        query: context.fireProvider.mainCategoriesQuery,
        builder: (context, snapshot) {
          final categories = snapshot.docs;
          return GridView.builder(
            itemCount: categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemBuilder: (context, index) {
              final category = categories[index].data();
              return CategoryBubble(
                category: category,
              );
            },
          );
        },
      ),
    );
  }
}
