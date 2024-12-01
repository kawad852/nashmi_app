import 'package:flutter/material.dart';
import 'package:nashmi_app/utils/base_extensions.dart';

import '../utils/my_icons.dart';
import 'custom_svg.dart';
import 'editors/base_editor.dart';

class SearchEditor extends StatelessWidget {
  const SearchEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseEditor(
      hintText: context.appLocalization.whatAreYouLooking,
      hintStyle: TextStyle(
        color: context.colorPalette.blackD1D,
        fontSize: 14,
      ),
      prefixIcon: const IconButton(
        onPressed: null,
        icon: CustomSvg(MyIcons.search),
      ),
      readOnly: true,
    );
  }
}
