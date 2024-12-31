import 'package:flutter/material.dart';
import 'package:nashmi_app/alerts/feedback/app_feedback.dart';
import 'package:nashmi_app/models/city/city_model.dart';
import 'package:nashmi_app/models/state/state_model.dart';
import 'package:nashmi_app/providers/location_provider.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/widgets/area_sheet.dart';
import 'package:provider/provider.dart';

import '../utils/my_icons.dart';
import 'custom_svg.dart';

class AreaButton extends StatefulWidget {
  const AreaButton({
    super.key,
  });

  @override
  State<AreaButton> createState() => _AreaButtonState();
}

class _AreaButtonState extends State<AreaButton> with AutomaticKeepAliveClientMixin {
  void _openSheet(
    BuildContext context, {
    required StateModel? selectedState,
    required CityModel? selectedCity,
  }) {
    context.showBottomSheet<(StateModel?, CityModel?)?>(
      context,
      maxHeight: 300,
      builder: (BuildContext context) {
        return const AreaSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<LocationProvider>(
      builder: (context, locationProvider, child) {
        final selectedState = locationProvider.selectedState;
        final selectedCity = locationProvider.selectedCity;

        if (selectedState == null) {
          return TextButton(
            onPressed: () {
              _openSheet(
                context,
                selectedState: null,
                selectedCity: null,
              );
            },
            child: Text(context.appLocalization.determineArea),
          );
        }

        // final stateName = locationProvider.state;
        // final cityName = locationProvider.city;
        final stateName = locationProvider.state;
        final cityName = locationProvider.city;

        return ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 250),
          child: InkWell(
            onTap: () {
              _openSheet(
                context,
                selectedState: selectedState,
                selectedCity: selectedCity,
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text.rich(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: "📍️",
                        ),
                        if (selectedState != null || stateName != null)
                          TextSpan(
                            text: selectedState != null ? context.translate(textEN: selectedState.nameEn, textAR: selectedState.nameAr) : stateName,
                          ),
                        if (selectedCity != null || (cityName != null && selectedState == null)) ...[
                          const TextSpan(text: ", "),
                          TextSpan(
                            text: selectedCity != null ? context.translate(textEN: selectedCity.nameEn, textAR: selectedCity.nameAr) : cityName,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                const CustomSvg(MyIcons.arrowDown),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
