import 'package:flutter/material.dart';
import 'package:nashmi_app/utils/my_images.dart';

class NashmiScaffold extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget? appBar;

  const NashmiScaffold({
    super.key,
    required this.child,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(MyImages.appBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBar,
        body: child,
      ),
    );
  }
}
