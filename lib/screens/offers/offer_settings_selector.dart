import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/offer_settings/offer_settings_model.dart';

class OfferSettingsSelector extends StatelessWidget {
  final Widget Function(BuildContext, OfferSettingsModel?, Widget?) builder;
  const OfferSettingsSelector({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return Selector<OfferSettingsModel?, OfferSettingsModel?>(
      selector: (context, provider) => provider,
      builder: builder,
    );
  }
}
