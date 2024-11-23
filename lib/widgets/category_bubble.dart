import 'package:flutter/material.dart';
import 'package:nashmi_app/screens/single_category/single_category_screen.dart';
import 'package:nashmi_app/utils/app_constants.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/custom_network_image.dart';
import 'package:nashmi_app/widgets/custom_text.dart';

class CategoryBubble extends StatelessWidget {
  const CategoryBubble({super.key});

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
            child: const CustomNetworkImage(
              kFakeImage,
              width: 50,
              height: 50,
            ),
          ),
        ),
        const CustomText(
          "Category",
          overFlow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
