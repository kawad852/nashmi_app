import 'package:flutter/material.dart';
import 'package:nashmi_app/utils/my_images.dart';

class AppContainer extends StatelessWidget {
  final Widget child;
  const AppContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(MyImages.appBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
