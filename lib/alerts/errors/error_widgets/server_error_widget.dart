import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:flutter/material.dart';

class ServerErrorWidget extends StatelessWidget {
  const ServerErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                context.appLocalization.serverErrorTitle,
                style: context.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              context.appLocalization.serverErrorBody,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
