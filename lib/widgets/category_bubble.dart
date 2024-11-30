import 'package:flutter/material.dart';
import 'package:nashmi_app/models/category/category_model.dart';
import 'package:nashmi_app/screens/categories/categories_screen.dart';
import 'package:nashmi_app/screens/providers/providers_screen.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/custom_network_image.dart';

class CategoryBubble extends StatelessWidget {
  final CategoryModel category;

  const CategoryBubble({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (category.mainCategory && category.subCategories.isNotEmpty) {
          context.navigate(
            (context) => CategoriesScreen(
              mainCategory: category,
            ),
          );
        } else {
          context.navigate(
            (context) => ProvidersScreen(
              category: category,
            ),
          );
        }
      },
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: context.colorPalette.greyF2F,
              borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
            ),
            child: CustomNetworkImage(
              category.thumbnail!,
              width: 50,
              height: 50,
            ),
          ),
          Text(
            context.translate(
              textEN: category.nameEn!,
              textAR: category.nameAr!,
            ),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
