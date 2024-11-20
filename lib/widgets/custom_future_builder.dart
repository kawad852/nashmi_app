import 'package:nashmi_app/widgets/custom_loading_indicator.dart';
import 'package:nashmi_app/widgets/material_cover.dart';
import 'package:flutter/material.dart';

class CustomFutureBuilder<T> extends StatelessWidget {
  final Future<T> future;
  final T? initialData;
  final Function(BuildContext context, AsyncSnapshot<T?> snapshot) onComplete;
  final Function()? onLoading;
  final Function(Object? error) onError;
  final bool withBackgroundColor;
  final bool isSliver;

  const CustomFutureBuilder({
    super.key,
    required this.future,
    required this.onComplete,
    this.onLoading,
    required this.onError,
    this.withBackgroundColor = false,
    this.initialData,
    this.isSliver = false,
  });

  Widget _buildLoading() {
    return onLoading == null
        ? CustomLoadingIndicator(withBackgroundColor: withBackgroundColor)
        : MaterialCover(
            child: onLoading!(),
            withBackgroundColor: withBackgroundColor,
          );
  }

  Widget _buildError(AsyncSnapshot<T?> snapshot) {
    return onError(snapshot.error);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T?>(
      future: future,
      initialData: initialData,
      builder: (context, AsyncSnapshot<T?> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return isSliver ? SliverToBoxAdapter(child: _buildLoading()) : _buildLoading();
          case ConnectionState.done:
          default:
            if (snapshot.hasData) {
              return onComplete(context, snapshot);
            } else {
              debugPrint("SnapshotError:: ${snapshot.error}");
              return isSliver ? SliverToBoxAdapter(child: _buildError(snapshot)) : _buildError(snapshot);
            }
        }
      },
    );
  }
}
