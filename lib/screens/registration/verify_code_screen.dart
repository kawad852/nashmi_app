import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nashmi_app/screens/registration/welcome_screen.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/custom_back.dart';
import 'package:nashmi_app/widgets/custom_text.dart';
import 'package:nashmi_app/widgets/editors/text_editor.dart';
import 'package:nashmi_app/widgets/nashmi_scaffold.dart';
import 'package:nashmi_app/widgets/stretch_button.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NashmiScaffold(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              pinned: true,
              leadingWidth: kBarLeadingWith,
              backgroundColor: Colors.transparent,
              leading: CustomBack(),
            ),
            SliverPadding(
              padding: const EdgeInsetsDirectional.only(start: 20, end: 20, top: 50),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          fontFamily: GoogleFonts.cairo().fontFamily!,
                        ),
                        children: [
                          TextSpan(
                            text: context.appLocalization.welcomeNashmi,
                            style: TextStyle(
                              color: context.colorPalette.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          //TODO : "نشمي" or "نشمية "  According to the gender of the user
                          TextSpan(
                            text: " بالنشمي صهيب",
                            style: TextStyle(
                              color: context.colorPalette.redB31,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomText(
                      context.appLocalization.receivedCodeOnYourPhone,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: TextEditor(
                        initialValue: null,
                        textAlign: TextAlign.center,
                        hintText: context.appLocalization.codeHintText,
                        onChanged: (value) {},
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          fontFamily: GoogleFonts.cairo().fontFamily!,
                        ),
                        children: [
                          TextSpan(
                            text: context.appLocalization.didntReceiveCode,
                            style: TextStyle(
                              color: context.colorPalette.black,
                              fontSize: 14,
                            ),
                          ),
                          TextSpan(
                            text: " 01:22",
                            style: TextStyle(
                              color: context.colorPalette.redB31,
                              fontSize: 14,
                            ),
                          ),
                        ],
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
                        context.push(const WelcomeScreen());
                      },
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: CustomText(
                        context.appLocalization.enterTheCode,
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
