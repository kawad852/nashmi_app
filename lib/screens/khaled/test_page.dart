import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nashmi_app/alerts/errors/app_error_widget.dart';
import 'package:nashmi_app/network/fire_queries.dart';
import 'package:nashmi_app/screens/khaled/test_future_builder.dart';

import '../../models/provider/provider_model.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  late Future<List<ProviderModel>> _future;

  void _init() {
    _future = FirebaseFirestore.instance.providers.limit(2).get().then((value) {
      return value.docs.map((e) => e.data()).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            _init();
          });
        },
        child: TestFutureBuilder(
          future: _future,
          initialData: [
            ProviderModel(
              nameAr: "Khaled",
            ),
            ProviderModel(
              nameAr: "Awad",
            ),
          ],
          onComplete: (context, snapshot) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final provider = snapshot.data![index];
                return ListTile(
                  title: Text(provider.nameAr!),
                );
              },
            );
          },
          onError: (error) {
            return AppErrorWidget(
              error: error,
              onRetry: () {
                setState(() {
                  _init();
                });
              },
            );
          },
        ),
      ),
    );
  }
}
