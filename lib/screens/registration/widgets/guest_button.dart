import 'package:flutter/material.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/widgets/custom_text.dart';

class GuestButton extends StatelessWidget {
  final void Function() onTap;
  const GuestButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            CustomText(
              context.appLocalization.welcomeGuest,
              color: context.colorPalette.white,
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: context.colorPalette.white,
              size: 15,
            )
          ],
        ),
      ),
    );
  }
}
