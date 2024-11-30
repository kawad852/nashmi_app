import 'package:flutter/material.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_images.dart';

class NashmiScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;

  const NashmiScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        image: const DecorationImage(
          image: AssetImage(MyImages.appBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBar,
        bottomNavigationBar: bottomNavigationBar,
        body: body,
      ),
    );
  }
}
