import 'package:flutter/material.dart';
import 'package:nashmi_app/models/category/category_model.dart';
import 'package:nashmi_app/screens/single_category/single_category_screen.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/custom_network_image.dart';
import 'package:nashmi_app/widgets/custom_text.dart';

class CategoryBubble extends StatelessWidget {
  final CategoryModel category;

  const CategoryBubble({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            context.push(const SingleCategoryScreen());
          },
          child: Container(
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
        ),
        CustomText(
          context.translate(
            textEN: category.nameEn!,
            textAR: category.nameAr!,
          ),
          overFlow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
