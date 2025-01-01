import 'package:flutter/material.dart';
import 'package:nashmi_app/models/provider/provider_model.dart';
import 'package:nashmi_app/network/fire_queries.dart';
import 'package:nashmi_app/screens/khaled/fire_controller.dart';
import 'package:nashmi_app/screens/khaled/fire_future.dart';
import 'package:nashmi_app/utils/base_extensions.dart';

class KhaledScreen extends StatefulWidget {
  final String providerId;

  const KhaledScreen({
    super.key,
    required this.providerId,
  });

  @override
  State<KhaledScreen> createState() => _KhaledScreenState();
}

class _KhaledScreenState extends State<KhaledScreen> {
  late FireController<List<dynamic>> _fireController;

  @override
  void initState() {
    super.initState();
    _fireController = FireController(
      context,
      futures: (fire) {
        final providersFuture = fire.providers.limit(2).get().then((value) {
          return value.docs.map((e) => e.data()).toList();
        });
        final numberFuture = Future.delayed(const Duration(seconds: 2), () => 7);
        return Future.wait([providersFuture, numberFuture]);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _fireController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colorScheme.primary,
      ),
      body: FireFuture(
        controller: _fireController,
        // initialData: [
        //   [
        //     ProviderModel(
        //       nameAr: "Khaled",
        //     ),
        //     ProviderModel(
        //       nameAr: "Awad",
        //     ),
        //   ],
        //   8,
        // ],
        onComplete: (context, snapshot) {
          final providers = snapshot.data![0] as List<ProviderModel>;
          final number = snapshot.data![1] as int;
          return RefreshIndicator(
            onRefresh: () async {
              _fireController.refresh(force: true);
            },
            child: Column(
              children: [
                FilterChip(
                  label: Text(
                    number.toString(),
                  ),
                  onSelected: (bool value) {},
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: providers.length,
                    itemBuilder: (context, index) {
                      final provider = providers[index];
                      return ListTile(
                        title: Text(provider.nameAr!),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
