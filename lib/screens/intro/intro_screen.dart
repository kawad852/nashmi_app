import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nashmi_app/screens/registration/registration_screen.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_images.dart';
import 'package:nashmi_app/widgets/app_container.dart';
import 'package:nashmi_app/widgets/custom_smoth_indicator.dart';
import 'package:nashmi_app/widgets/custom_text.dart';
import 'package:nashmi_app/widgets/stretch_button.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late PageController _pageController;
  int _currentIndex = 0;
  List<String> mainImage = [MyImages.intro0, MyImages.intro1, MyImages.intro2];
  List<String> title() {
    return [
      context.appLocalization.welcomeTo,
      context.appLocalization.commercialAndServiceFacilities,
      context.appLocalization.allRegionsAndGovernorates,
    ];
  }

  List<String> redTitle() {
    return [
      context.appLocalization.nashmiMarket,
      context.appLocalization.nashmiMarket,
      context.appLocalization.present,
    ];
  }

  List<String> description() {
    return [
      context.appLocalization.introDes0,
      context.appLocalization.introDes1,
      context.appLocalization.introDes2,
    ];
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
    return Scaffold(
      body: AppContainer(
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
                  const SizedBox(height: 30),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: IconButton(
                      onPressed: () {
                        context.pushAndRemoveUntil(const RegistrationScreen());
                      },
                      icon: CustomText(context.appLocalization.skip),
                    ),
                  ),
                  ElasticInRight(
                    animate: true,
                    child: Flash(
                      child: Image.asset(mainImage[index]),
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
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          fontFamily: GoogleFonts.cairo().fontFamily!,
                        ),
                        children: [
                          TextSpan(
                            text: title()[index],
                            style: TextStyle(
                              color: context.colorPalette.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: redTitle()[index],
                            style: TextStyle(
                              color: context.colorPalette.redB31,
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
                    description()[index],
                    fontSize: 16,
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  StretchedButton(
                    onPressed: () {
                      if (_pageController.page == 2) {
                        context.pushAndRemoveUntil(const RegistrationScreen());
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInExpo,
                        );
                      }
                    },
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomText(
                      context.appLocalization.next,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: context.colorPalette.white,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
