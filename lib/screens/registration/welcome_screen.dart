import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/app_container.dart';
import 'package:nashmi_app/widgets/custom_back.dart';
import 'package:nashmi_app/widgets/custom_text.dart';
import 'package:nashmi_app/widgets/stretch_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
              padding: const EdgeInsetsDirectional.only(start: 20, end: 20, top: 70),
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
                            text: context.appLocalization.helloHello,
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
                    const SizedBox(height: 20),
                    CustomText(
                      context.appLocalization.thanksFollowing,
                      textAlign: TextAlign.center,
                      fontSize: 16,
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
                      onPressed: () {},
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: CustomText(
                        context.appLocalization.cont,
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
