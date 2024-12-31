import 'package:flutter/material.dart';
import 'package:nashmi_app/screens/provider/widgets/filter_bubble.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/dimensions.dart';
import 'package:nashmi_app/utils/enums.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/utils/providers_extension.dart';

class FilterSheet extends StatelessWidget {
  final FilterEnum filterEnum;

  const FilterSheet({
    super.key,
    required this.filterEnum,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(kScreenMargin),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilterBubble(
              icon: MyIcons.offersSelect,
              title: context.appLocalization.mostRated,
              selected: filterEnum == FilterEnum.topRated,
              onTap: () {
                Navigator.pop(context, FilterEnum.topRated);
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: FilterBubble(
                icon: MyIcons.like,
                title: context.appLocalization.mostLikes,
                selected: filterEnum == FilterEnum.mostLikes,
                onTap: () {
                  Navigator.pop(context, FilterEnum.mostLikes);
                },
              ),
            ),
            FilterBubble(
              icon: MyIcons.location,
              title: context.appLocalization.nearestDistance,
              selected: filterEnum == FilterEnum.nearest,
              onTap: () {
                context.locationProvider.determinePosition(
                  context,
                  withOverLayLoader: true,
                  onPermissionGranted: () {
                    Navigator.pop(context, FilterEnum.nearest);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
