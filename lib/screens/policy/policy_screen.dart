import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:nashmi_app/alerts/errors/app_error_widget.dart';

import '../../models/policy/policy_model.dart';
import '../../network/fire_queries.dart';
import '../../utils/base_extensions.dart';
import '../../widgets/custom_future_builder.dart';

class PolicyScreen extends StatefulWidget {
  final String id;

  const PolicyScreen({
    super.key,
    required this.id,
  });

  @override
  State<PolicyScreen> createState() => _PolicyScreenState();
}

class _PolicyScreenState extends State<PolicyScreen> {
  late Future<DocumentSnapshot<PolicyModel>> _policyFuture;

  FirebaseFirestore get _firebaseFirestore => FirebaseFirestore.instance;
  String get _policyId => widget.id;

  void _initializeFuture() {
    _policyFuture = _firebaseFirestore.policies.doc(_policyId).get();
  }

  @override
  void initState() {
    super.initState();
    _initializeFuture();
  }

  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder(
      future: _policyFuture,
      withBackgroundColor: true,
      onComplete: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.translate(
              textEN: snapshot.data!.data()!.titleEn!,
              textAR: snapshot.data!.data()!.titleAr!,
            )),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Html(
              data: context.translate(
                textEN: snapshot.data!.data()!.contentEn!,
                textAR: snapshot.data!.data()!.contentAr!,
              ),
            ),
          ),
        );
      },
      onError: (error) {
        return AppErrorWidget(
          error: error,
          onRetry: () {
            setState(() {
              _initializeFuture();
            });
          },
        );
      },
    );
  }
}
