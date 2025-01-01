import 'package:flutter/material.dart';
import 'package:nashmi_app/alerts/errors/error_widgets/internet_error_widget.dart';
import 'package:nashmi_app/screens/khaled/fire_controller.dart';

class FireFuture<T> extends StatefulWidget {
  final FireController<T> controller;
  final Function(BuildContext context, AsyncSnapshot<T?> snapshot) onComplete;
  final T? initialData;

  const FireFuture({
    super.key,
    required this.controller,
    required this.onComplete,
    this.initialData,
  });

  @override
  State<FireFuture<T>> createState() => _FireFutureState<T>();
}

class _FireFutureState<T> extends State<FireFuture<T>> {
  late FireController<T> _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _controller.addListener(() {
      print("lkasjflakjsfkljasfjkl ${_controller.forceRefresh}");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: _controller.futures,
      // initialData: _controller.forceRefresh ? null : widget.initialData,
      builder: (context, AsyncSnapshot<T?> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            if (snapshot.hasData) {
              return widget.onComplete(context, snapshot);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.done:
          default:
            if (snapshot.hasData) {
              return widget.onComplete(context, snapshot);
            } else {
              debugPrint("SnapshotError:: ${snapshot.error}");
              return InternetErrorWidget(
                onRetry: () {},
              );
            }
        }
      },
    );
  }
}
