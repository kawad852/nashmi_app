import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nashmi_app/utils/providers_extension.dart';

import '../../../utils/base_extensions.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/my_theme.dart';
import '../../../widgets/stretch_button.dart';

class GrantLocationCard extends StatefulWidget {
  final VoidCallback? onPermissionGranted;

  const GrantLocationCard({
    Key? key,
    required this.onPermissionGranted,
  }) : super(key: key);

  @override
  State<GrantLocationCard> createState() => _GrantLocationCardState();
}

class _GrantLocationCardState extends State<GrantLocationCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(kScreenMargin),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MyTheme.radiusPrimary)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                FontAwesomeIcons.marker,
                size: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                child: Text(
                  context.appLocalization.locationAccess,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Text(
                context.appLocalization.locationAccessBody,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              StretchedButton(
                margin: const EdgeInsets.only(top: 30),
                onPressed: () {
                  context.locationProvider.determinePosition(
                    context,
                    onPermissionGranted: widget.onPermissionGranted,
                    showSnackBar: true,
                    withOverLayLoader: true,
                  );
                },
                child: Text(context.appLocalization.allow),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
