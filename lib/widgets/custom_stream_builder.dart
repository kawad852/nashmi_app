import 'package:flutter/material.dart';

import '../../alerts/errors/error_widgets/server_error_widget.dart';
import '../../widgets/custom_loading_indicator.dart';

class CustomStreamBuilder<T> extends StatelessWidget {
  final Stream<T> stream;
  final Function(BuildContext context, AsyncSnapshot<T?> snapshot) onComplete;
  final Function()? onLoading;
  final Function(AsyncSnapshot<T?> snapshot)? onError;
  final bool withBackgroundColor;
  final T? initialData;

  const CustomStreamBuilder({
    Key? key,
    required this.stream,
    required this.onComplete,
    this.onLoading,
    this.onError,
    this.withBackgroundColor = false,
    this.initialData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T?>(
      stream: stream,
      initialData: initialData,
      builder: (context, AsyncSnapshot<T?> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return onLoading == null ? CustomLoadingIndicator(withBackgroundColor: withBackgroundColor) : onLoading!();
          case ConnectionState.done:
          default:
            if (snapshot.hasData) {
              return onComplete(context, snapshot);
            } else {
              debugPrint("SnapshotError:: ${snapshot.error}");
              return onError == null ? const ServerErrorWidget() : onError!(snapshot);
            }
        }
      },
    );
  }
}
