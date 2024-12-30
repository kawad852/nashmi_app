import 'package:flutter/material.dart';
import 'package:nashmi_app/alerts/feedback/app_feedback.dart';
import 'package:nashmi_app/controllers/phone_controller.dart';
import 'package:nashmi_app/models/user/user_model.dart';
import 'package:nashmi_app/screens/policy/policy_screen.dart';
import 'package:nashmi_app/screens/registration/registration_screen.dart';
import 'package:nashmi_app/utils/app_constants.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/dimensions.dart';
import 'package:nashmi_app/utils/providers_extension.dart';
import 'package:nashmi_app/widgets/custom_text.dart';
import 'package:nashmi_app/widgets/editors/text_editor.dart';
import 'package:nashmi_app/widgets/nashmi_scaffold.dart';
import 'package:nashmi_app/widgets/phone_field.dart';
import 'package:nashmi_app/widgets/stretch_button.dart';
import 'package:nashmi_app/widgets/titled_textfield.dart';

class CreateAccountScreen extends StatefulWidget {
  final String? guestRoute;
  final UserModel? user;

  const CreateAccountScreen({
    super.key,
    required this.guestRoute,
    this.user,
  });

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  late PhoneController phoneController;
  late UserModel user;
  bool _isAgreeTerms = false;
  final _formKey = GlobalKey<FormState>();

  void _onSubmit(BuildContext context) {
    if (!_isAgreeTerms) {
      context.showSnackBar(context.appLocalization.termsMsg);
      return;
    } else if (user.gender == null) {
      context.showSnackBar(context.appLocalization.genderMsg);
    } else {
      if (_formKey.currentState!.validate()) {
        if (widget.user != null) {
          context.userProvider.registerUncompletedUser(
            context,
            user: user,
            guestRoute: widget.guestRoute,
          );
        } else {
          user.phoneCountryCode = phoneController.countryCode;
          user.phone = phoneController.phoneNum!;
          context.userProvider.sendPinCode(
            context,
            user: user,
            guestRoute: widget.guestRoute,
            isLogin: false,
          );
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    user = widget.user ?? UserModel();
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
      body: NashmiScaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(kScreenMargin),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                      context.pushAndRemoveUntil((context) => const RegistrationScreen());
                    },
                    child: CustomText(
                      context.appLocalization.login,
                      color: context.colorPalette.red018,
                    ),
                  ),
                ],
              ),
              StretchedButton(
                onPressed: () {
                  _onSubmit(context);
                },
                child: CustomText(
                  context.appLocalization.register,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: context.colorPalette.white,
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(kScreenMargin),
          child: Form(
            key: _formKey,
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
                      color: context.colorPalette.red018,
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
                    initialValue: user.displayName,
                    hintText: context.appLocalization.nameHintText,
                    onChanged: (value) => user.displayName = value,
                  ),
                ),
                if (widget.user == null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: TitledTextField(
                      title: context.appLocalization.yourPhoneNumber,
                      child: PhoneField(
                        controller: phoneController,
                      ),
                    ),
                  ),
                // Padding(
                //   padding: const EdgeInsets.only(bottom: 10),
                //   child: CustomText(
                //     context.appLocalization.maleOrFemale,
                //   ),
                // ),
                // Row(
                //   children: [
                //     GenderCard(
                //       onTap: () {
                //         setState(() {
                //           user.gender = GenderType.male.value;
                //         });
                //       },
                //       icon: MyIcons.male,
                //       title: context.appLocalization.male,
                //       isSelected: user.gender == GenderType.male.value,
                //     ),
                //     const SizedBox(width: 10),
                //     GenderCard(
                //       onTap: () {
                //         setState(() {
                //           user.gender = GenderType.female.value;
                //         });
                //       },
                //       icon: MyIcons.female,
                //       title: context.appLocalization.female,
                //       isSelected: user.gender == GenderType.female.value,
                //     ),
                //   ],
                // ),
                Row(
                  children: [
                    Checkbox(
                      value: _isAgreeTerms,
                      activeColor: context.colorPalette.red018,
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
                        onPressed: () {
                          context.navigate((context) {
                            return const PolicyScreen(id: PolicyDocuments.termsOfUse);
                          });
                        },
                        child: CustomText(
                          context.appLocalization.termsAndPolicy,
                          color: context.colorPalette.red018,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
