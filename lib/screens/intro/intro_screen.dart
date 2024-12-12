import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nashmi_app/screens/registration/registration_screen.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/dimensions.dart';
import 'package:nashmi_app/utils/my_images.dart';
import 'package:nashmi_app/utils/shared_pref.dart';
import 'package:nashmi_app/widgets/custom_smoth_indicator.dart';
import 'package:nashmi_app/widgets/custom_text.dart';
import 'package:nashmi_app/widgets/nashmi_scaffold.dart';
import 'package:nashmi_app/widgets/stretch_button.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late PageController _pageController;
  int _currentIndex = 0;

  (String image, String title, String subTitle, String description) _toggleInfo(int index) {
    switch (index) {
      case 1:
        return (MyImages.intro1, context.appLocalization.commercialAndServiceFacilities, context.appLocalization.nashmiMarket, context.appLocalization.introDes1);
      case 2:
        return (MyImages.intro2, context.appLocalization.allRegionsAndGovernorates, context.appLocalization.present, context.appLocalization.introDes2);
      default:
        return (MyImages.intro0, context.appLocalization.welcomeTo, context.appLocalization.nashmiMarket, context.appLocalization.introDes0);
    }
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final info = _toggleInfo(_currentIndex);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: StretchedButton(
        alignment: AlignmentDirectional.bottomCenter,
        onPressed: () {
          if (_pageController.page == 2) {
            MySharedPreferences.passedIntro = true;
            context.pushAndRemoveUntil((context) => const RegistrationScreen());
          } else {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInExpo,
            );
          }
        },
        margin: const EdgeInsets.symmetric(horizontal: kScreenMargin),
        child: Text(
          context.appLocalization.next,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: context.colorPalette.white,
          ),
        ),
      ),
      body: NashmiScaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          actions: [
            IconButton(
              onPressed: () {
                MySharedPreferences.passedIntro = true;
                context.pushAndRemoveUntil((context) => const RegistrationScreen());
              },
              icon: CustomText(context.appLocalization.skip),
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 350,
              child: FadeIn(
                key: ValueKey(_currentIndex),
                child: Image.asset(info.$1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: CustomSmoothIndicator(
                  count: 3,
                  index: _currentIndex,
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: 3,
                onPageChanged: (value) {
                  setState(() {
                    _currentIndex = value;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextStyle(
                                fontFamily: GoogleFonts.cairo().fontFamily!,
                              ),
                              children: [
                                TextSpan(
                                  text: info.$2,
                                  style: TextStyle(
                                    color: context.colorPalette.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: info.$3,
                                  style: TextStyle(
                                    color: context.colorPalette.red018,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomText(
                          info.$4,
                          fontSize: 16,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
