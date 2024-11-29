import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nashmi_app/controllers/phone_controller.dart';
import 'package:nashmi_app/screens/registration/create_account_screen.dart';
import 'package:nashmi_app/screens/registration/forgot_password_screen.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/widgets/custom_svg.dart';
import 'package:nashmi_app/widgets/custom_text.dart';
import 'package:nashmi_app/widgets/editors/password_editor.dart';
import 'package:nashmi_app/widgets/nashmi_scaffold.dart';
import 'package:nashmi_app/widgets/phone_field.dart';
import 'package:nashmi_app/widgets/stretch_button.dart';
import 'package:nashmi_app/widgets/titled_textfield.dart';

import 'widgets/guest_button.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
      body: NashmiScaffold(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              collapsedHeight: 230,
              backgroundColor: Colors.transparent,
              actions: [
                GuestButton(onTap: () {}),
              ],
              flexibleSpace: Container(
                width: double.infinity,
                height: 261,
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF1D1D1D),
                      Color(0x001D1D1D),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: CustomSvg(MyIcons.logo),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      context.appLocalization.helloAndWelcome,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child: CustomText(
                        context.appLocalization.joinUsButTellUsWhoYou,
                      ),
                    ),
                    TitledTextField(
                      title: context.appLocalization.yourPhoneNumber,
                      child: PhoneField(
                        controller: phoneController,
                      ),
                    ),
                    TitledTextField(
                      title: context.appLocalization.yourPassword,
                      child: PasswordEditor(
                        initialValue: null,
                        onChanged: (value) {},
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: TextButton(
                        onPressed: () {
                          context.push(const ForgotPasswordScreen());
                        },
                        child: CustomText(
                          context.appLocalization.forgotYourPassword,
                          color: context.colorPalette.redB31,
                        ),
                      ),
                    ),
                    StretchedButton(
                      onPressed: () {},
                      child: CustomText(
                        context.appLocalization.welcome,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: context.colorPalette.white,
                      ),
                    ),
                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            fontFamily: GoogleFonts.cairo().fontFamily!,
                          ),
                          children: [
                            TextSpan(
                              text: context.appLocalization.dontHaveAccount,
                              style: TextStyle(
                                color: context.colorPalette.black,
                                fontSize: 16,
                              ),
                            ),
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: TextButton(
                                onPressed: () {
                                  context.push(const CreateAccountScreen());
                                },
                                child: CustomText(
                                  context.appLocalization.createAccount,
                                  fontSize: 16,
                                  color: context.colorPalette.redB31,
                                ),
                              ),
                            ),
                          ],
                        ),
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
                    Center(
                      child: CustomText(
                        context.appLocalization.orPleaseLogThrough,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const CustomSvg(MyIcons.apple),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const CustomSvg(MyIcons.google),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const CustomSvg(MyIcons.facebook),
                        ),
                      ],
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
