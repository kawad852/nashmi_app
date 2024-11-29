import 'package:flutter/material.dart';

import '../alerts/errors/app_error_widget.dart';
import '../network/api_service.dart';
import 'custom_future_builder.dart';

// Type Safe

class FireBuilder extends StatefulWidget {
  final List<Future<Object>> futures;
  final Function(BuildContext context, AsyncSnapshot<List<Object>?> snapshot) onComplete;
  final List<Object>? initialData;

  const FireBuilder({
    super.key,
    required this.onComplete,
    required this.futures,
    this.initialData,
  });

  @override
  State<FireBuilder> createState() => _FireBuilderState();
}

class _FireBuilderState extends State<FireBuilder> {
  late List<Object>? _initialData;
  late Future<List<Object>> _futures;

  Future<List<Object>> _fetchFutures() {
    return ApiService.build(
      callBack: () async {
        return Future.wait(widget.futures);
      },
    );
  }

  void _initialize() {
    _futures = _fetchFutures();
  }

  @override
  void initState() {
    super.initState();
    _initialData = widget.initialData;
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder<List<Object>>(
      future: _futures,
      onComplete: widget.onComplete,
      initialData: _initialData,
      onError: (error) {
        return Scaffold(
          appBar: AppBar(),
          body: AppErrorWidget(
            error: error,
            onRetry: () {
              setState(() {
                _initialize();
              });
            },
          ),
        );
      },
    );
  }
}
