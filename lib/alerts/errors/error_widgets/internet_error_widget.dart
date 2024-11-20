import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:flutter/material.dart';

class InternetErrorWidget extends StatelessWidget {
  final VoidCallback onRetry;

  const InternetErrorWidget({
    super.key,
    required this.onRetry,
  });

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
                context.appLocalization.connectionErrorTitle,
                style: context.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              context.appLocalization.connectionErrorBody,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: onRetry,
              child: Text(
                context.appLocalization.retry,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
