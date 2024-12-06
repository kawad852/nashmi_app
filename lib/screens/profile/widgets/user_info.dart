import 'package:flutter/material.dart';
import 'package:nashmi_app/screens/profile/edit_profile_screen.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/custom_network_image.dart';
import 'package:nashmi_app/widgets/custom_svg.dart';
import 'package:nashmi_app/widgets/custom_text.dart';
import 'package:nashmi_app/widgets/user_selector.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return UserSelector(builder: (context, user) {
      if (user == null) {
        return const SizedBox.shrink();
      }
      return Container(
        width: double.infinity,
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: context.colorPalette.greyF2F,
          borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
        ),
        child: Row(
          children: [
            if (user.photoURL != null)
              CustomNetworkImage(
                user.photoURL!,
                width: 50,
                height: 50,
                radius: MyTheme.radiusSecondary,
              )
            else
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
                  color: context.colorPalette.redB31,
                ),
                alignment: Alignment.center,
                child: CustomSvg(MyIcons.nashmi),
              ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (user.displayName != null)
                    CustomText(
                      user.displayName!,
                      overFlow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                    ),
                  CustomText(
                    "298461031",
                    fontSize: 12,
                    overFlow: TextOverflow.ellipsis,
                    color: context.colorPalette.grey8F8,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                context.push(const EditProfileScreen());
              },
              icon: const CustomSvg(MyIcons.setting),
            ),
          ],
        ),
      );
    });
  }
}
