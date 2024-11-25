import 'package:flutter/material.dart';
import 'package:nashmi_app/utils/app_constants.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/custom_network_image.dart';
import 'package:nashmi_app/widgets/custom_text.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          centerTitle: true,
          title: CustomText(
            context.appLocalization.notifications,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverList.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CustomNetworkImage(
                        kFakeImage,
                        width: 70,
                        height: 70,
                        radius: MyTheme.radiusSecondary,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomText(
                              "يوم نشمي يوم النشامى",
                              overFlow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold,
                            ),
                            CustomText(
                              "استنوا عروض يوم نشمي الجمعة الجاية، لا تنسوا ! يوم الجمعة الجاية في عروض نااااااااار.",
                              fontSize: 12,
                              maxLines: 2,
                              overFlow: TextOverflow.ellipsis,
                              color: context.colorPalette.grey5F5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: CustomText(
                      "15.10.2024",
                      fontSize: 12,
                    ),
                  ),
                  Divider(color: context.colorPalette.greyF7E),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
