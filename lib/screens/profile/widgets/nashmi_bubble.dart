import 'package:flutter/material.dart';
import 'package:nashmi_app/utils/base_extensions.dart';

import '../../../utils/my_icons.dart';
import '../../../utils/my_theme.dart';
import '../../../widgets/custom_svg.dart';

class NashmiBubble extends StatelessWidget {
  final double size;
  const NashmiBubble({
    super.key,
    this.size = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
        color: context.colorPalette.red018,
      ),
      alignment: Alignment.center,
      child: const CustomSvg(MyIcons.nashmi),
    );
  }
}
