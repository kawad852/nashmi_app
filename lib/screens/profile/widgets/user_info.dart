import 'package:flutter/material.dart';
import 'package:nashmi_app/screens/profile/edit_profile_screen.dart';
import 'package:nashmi_app/utils/app_constants.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/custom_network_image.dart';
import 'package:nashmi_app/widgets/custom_svg.dart';
import 'package:nashmi_app/widgets/custom_text.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
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
          const CustomNetworkImage(
            kFakeImage,
            width: 50,
            height: 50,
            radius: MyTheme.radiusSecondary,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(
                  "صهيب العجارمة",
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
  }
}
