import 'package:flutter/material.dart';
import 'package:nashmi_app/alerts/feedback/app_feedback.dart';
import 'package:nashmi_app/models/city/city_model.dart';
import 'package:nashmi_app/models/state/state_model.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/widgets/area_sheet.dart';

import '../utils/my_icons.dart';
import 'custom_svg.dart';

class AreaButton extends StatefulWidget {
  final StateModel? state;
  final CityModel? city;
  final Function(StateModel?, CityModel?) onSelect;

  const AreaButton({
    super.key,
    required this.state,
    required this.city,
    required this.onSelect,
  });

  @override
  State<AreaButton> createState() => _AreaButtonState();
}

class _AreaButtonState extends State<AreaButton> with AutomaticKeepAliveClientMixin {
  late StateModel? _state;
  late CityModel? _city;

  void _openSheet(BuildContext context) {
    context.showBottomSheet<(StateModel?, CityModel?)?>(
      context,
      maxHeight: 300,
      builder: (BuildContext context) {
        return AreaSheet(
          state: _state,
          city: _city,
        );
      },
    ).then((value) {
      if (value != null) {
        setState(() {
          _state = value.$1;
          _city = value.$2;
        });
        widget.onSelect(_state, _city);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _state = widget.state;
    _city = widget.city;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return InkWell(
      onTap: () {
        _openSheet(context);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text.rich(
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            TextSpan(
              children: [
                if (_state != null)
                  TextSpan(
                    text: context.translate(textEN: _state!.nameEn, textAR: _state!.nameAr),
                  ),
                if (_city != null)
                  TextSpan(
                    text: context.translate(textEN: _city!.nameEn, textAR: _city!.nameAr),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 5),
          const CustomSvg(MyIcons.arrowDown),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
