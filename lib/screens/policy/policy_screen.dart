import 'package:flutter/material.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/enums.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/custom_back.dart';
import 'package:nashmi_app/widgets/custom_text.dart';
import 'package:nashmi_app/widgets/nashmi_scaffold.dart';

class PolicyScreen extends StatefulWidget {
  final PolicyType policyType;
  const PolicyScreen({super.key, required this.policyType});

  @override
  State<PolicyScreen> createState() => _PolicyScreenState();
}

class _PolicyScreenState extends State<PolicyScreen> {
  PolicyType get _policyType => widget.policyType;

  String _getTitle() {
    switch (_policyType) {
      case PolicyType.knowUs:
        return context.appLocalization.getKnowUs;
      case PolicyType.privacyPolicy:
        return context.appLocalization.privacyPolicy;
      case PolicyType.termsAndConditions:
        return context.appLocalization.termsAndConditions;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NashmiScaffold(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              centerTitle: true,
              leadingWidth: kBarLeadingWith,
              leading: const CustomBack(),
              title: CustomText(
                _getTitle(),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.only(top: 15, bottom: 25),
                      child: CustomText(
                        "تطبيق سوق نشمي",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CustomText(
                      "هنا يمكن كتابة معلومات ووصف عن سوق نشمي من خلال لوحة التحكم هنا يمكن كتابة معلومات ووصف عن سوق نشمي من خلال لوحة التحكم هنا يمكن كتابة معلومات ووصف عن سوق نشمي من خلال لوحة التحكم هنا يمكن كتابة معلومات ووصف عن سوق نشمي من خلال لوحة التحكم ",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
