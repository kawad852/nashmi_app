import 'package:flutter/material.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/dimensions.dart';
import 'package:nashmi_app/utils/my_theme.dart';

class HeaderTile extends StatelessWidget {
  final String title;

  const HeaderTile({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minTileHeight: 10,
      contentPadding: const EdgeInsets.symmetric(horizontal: kScreenMargin),
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: context.colorPalette.blackD1D,
        fontFamily: MyTheme.fontFamily,
      ),
      title: Text(
        title,
      ),
    );
  }
}
