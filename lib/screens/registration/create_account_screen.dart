import 'package:flutter/material.dart';
import 'package:nashmi_app/controllers/phone_controller.dart';
import 'package:nashmi_app/screens/registration/registration_screen.dart';
import 'package:nashmi_app/screens/registration/verify_code_screen.dart';
import 'package:nashmi_app/screens/registration/widgets/gender_card.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/app_container.dart';
import 'package:nashmi_app/widgets/custom_back.dart';
import 'package:nashmi_app/widgets/custom_text.dart';
import 'package:nashmi_app/widgets/editors/password_editor.dart';
import 'package:nashmi_app/widgets/editors/text_editor.dart';
import 'package:nashmi_app/widgets/phone_field.dart';
import 'package:nashmi_app/widgets/stretch_button.dart';
import 'package:nashmi_app/widgets/titled_textfield.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  late PhoneController phoneController;
  bool _isMale = true;
  bool _isAgreeTerms = false;

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
                    
                    Row(
                      children: [
                        CustomText(
                          context.appLocalization.helloAndWelcome,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          " ${context.appLocalization.nashmi}",
                          fontSize: 22,
                          color: context.colorPalette.redB31,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 35),
                      child: CustomText(
                        context.appLocalization.fillForm,
                      ),
                    ),
                    TitledTextField(
                      title: context.appLocalization.whatYourName,
                      child: TextEditor(
                        initialValue: null,
                        hintText: context.appLocalization.nameHintText,
                        onChanged: (value) {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TitledTextField(
                        title: context.appLocalization.yourPhoneNumber,
                        child: PhoneField(
                          controller: phoneController,
                        ),
                      ),
                    ),
                    TitledTextField(
                      title: context.appLocalization.yourPassword,
                      child: PasswordEditor(
                        initialValue: null,
                        onChanged: (value) {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CustomText(
                        context.appLocalization.maleOrFemale,
                      ),
                    ),
                    Row(
                      children: [
                        GenderCard(
                          onTap: () {
                            setState(() {
                              _isMale = true;
                            });
                          },
                          icon: MyIcons.male,
                          title: context.appLocalization.male,
                          isSelected: _isMale,
                        ),
                        const SizedBox(width: 10),
                        GenderCard(
                          onTap: () {
                            setState(() {
                              _isMale = false;
                            });
                          },
                          icon: MyIcons.female,
                          title: context.appLocalization.female,
                          isSelected: !_isMale,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: _isAgreeTerms,
                          activeColor: context.colorPalette.redB31,
                          onChanged: (value) {
                            setState(() {
                              _isAgreeTerms = value!;
                            });
                          },
                        ),
                        CustomText(
                          "${context.appLocalization.doYouAgree}  ",
                        ),
                        Flexible(
                          child: TextButton(
                            onPressed: () {},
                            child: CustomText(
                              context.appLocalization.termsAndPolicy,
                              color: context.colorPalette.redB31,
                            ),
                          ),
                        ),
                      ],
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          context.appLocalization.alreadyHaveAccount,
                          fontSize: 16,
                        ),
                        TextButton(
                          onPressed: () {
                            context.pushAndRemoveUntil(const RegistrationScreen());
                          },
                          child: CustomText(
                            context.appLocalization.login,
                            color: context.colorPalette.redB31,
                          ),
                        ),
                      ],
                    ),
                    StretchedButton(
                      onPressed: () {
                        context.push(const VerifyCodeScreen());
                      },
                      child: CustomText(
                        context.appLocalization.register,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: context.colorPalette.white,
                      ),
                    ),
                    const SizedBox(height: 10),
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
