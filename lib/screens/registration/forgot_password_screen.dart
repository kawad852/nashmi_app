import 'package:flutter/material.dart';
import 'package:nashmi_app/controllers/phone_controller.dart';
import 'package:nashmi_app/screens/registration/verify_code_screen.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/app_container.dart';
import 'package:nashmi_app/widgets/custom_back.dart';
import 'package:nashmi_app/widgets/custom_text.dart';
import 'package:nashmi_app/widgets/phone_field.dart';
import 'package:nashmi_app/widgets/stretch_button.dart';
import 'package:nashmi_app/widgets/titled_textfield.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late PhoneController phoneController;

  @override
  void initState() {
    super.initState();
    phoneController = PhoneController(context);
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppContainer(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              pinned: true,
              leadingWidth: kBarLeadingWith,
              backgroundColor: Colors.transparent,
              leading: CustomBack(),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      context.appLocalization.forgotYourPassword,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    Row(
                      children: [
                        CustomText(
                          context.appLocalization.dontCare,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          context.appLocalization.yaNashmi,
                          fontSize: 22,
                          color: context.colorPalette.redB31,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomText(
                        context.appLocalization.enterYourPhoneNumber,
                      ),
                    ),
                    TitledTextField(
                      title: context.appLocalization.yourPhoneNumber,
                      child: PhoneField(
                        controller: phoneController,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    StretchedButton(
                      onPressed: () {
                        context.push(const VerifyCodeScreen());
                      },
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: CustomText(
                        context.appLocalization.sendTheCode,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: context.colorPalette.white,
                      ),
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
