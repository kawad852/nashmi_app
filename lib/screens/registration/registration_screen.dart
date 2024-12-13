import 'dart:convert';
import 'dart:math' as math;

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nashmi_app/alerts/feedback/app_feedback.dart';
import 'package:nashmi_app/controllers/phone_controller.dart';
import 'package:nashmi_app/models/user/user_model.dart';
import 'package:nashmi_app/providers/user_provider.dart';
import 'package:nashmi_app/screens/base/app_nav_bar.dart';
import 'package:nashmi_app/screens/registration/create_account_screen.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/utils/providers_extension.dart';
import 'package:nashmi_app/widgets/custom_svg.dart';
import 'package:nashmi_app/widgets/custom_text.dart';
import 'package:nashmi_app/widgets/nashmi_scaffold.dart';
import 'package:nashmi_app/widgets/phone_field.dart';
import 'package:nashmi_app/widgets/stretch_button.dart';
import 'package:nashmi_app/widgets/titled_textfield.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../alerts/loading/app_over_loader.dart';
import '../../network/api_service.dart';
import '../../utils/enums.dart';
import 'widgets/guest_button.dart';

class RegistrationScreen extends StatefulWidget {
  final String? guestRoute;
  final bool showGuestButton;
  const RegistrationScreen({
    super.key,
    this.guestRoute,
    this.showGuestButton = true,
  });

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late PhoneController phoneController;
  final _formKey = GlobalKey<FormState>();

  FirebaseAuth get _firebaseAuth => FirebaseAuth.instance;
  UserProvider get _userProvider => context.userProvider;

  String? get _guestRoute => widget.guestRoute;

  Future<void> _signInAnonymously(BuildContext context) async {
    ApiService.fetch(
      context,
      callBack: () async {
        await _firebaseAuth.signInAnonymously();
        if (context.mounted) {
          context.pushAndRemoveUntil((context) {
            return const AppNavBar();
          });
        }
      },
    );
  }

  void _signInWithPhoneNum(BuildContext context) {
    final user = UserModel();
    if (_formKey.currentState!.validate()) {
      user.phoneCountryCode = phoneController.countryCode;
      user.phone = phoneController.phoneNum!;
      context.userProvider.sendPinCode(
        context,
        user: user,
      );
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      AppOverlayLoader.show();
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      if (googleAuth?.accessToken == null) {
        AppOverlayLoader.hide();
        return;
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final auth = await _firebaseAuth.signInWithCredential(credential);
      if (context.mounted) {
        await _userProvider.register(
          context,
          auth,
          provider: AuthProviders.google,
          guestRoute: _guestRoute,
        );
      }
    } on PlatformException catch (e) {
      AppOverlayLoader.hide();
      if (context.mounted) {
        if (e.code == GoogleSignIn.kNetworkError) {
          context.showSnackBar(context.appLocalization.networkError);
        } else {
          if (context.mounted) {
            context.showSnackBar(context.appLocalization.generalError);
          }
        }
      }
      debugPrint("GoogleSignInException:: $e");
    } catch (e) {
      AppOverlayLoader.hide();
      if (context.mounted) {
        context.showSnackBar(context.appLocalization.generalError);
      }
      debugPrint("GoogleSignInException:: $e");
    }
  }

  Future<void> _signInWithApple(BuildContext context) async {
    try {
      AppOverlayLoader.show();
      final rawNonce = generateNonce();
      final nonce = sha256ofString(rawNonce);

      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
        accessToken: appleCredential.authorizationCode,
      );

      final auth = await _firebaseAuth.signInWithCredential(oauthCredential);
      if (context.mounted) {
        await _userProvider.register(
          context,
          auth,
          provider: AuthProviders.apple,
          guestRoute: _guestRoute,
        );
      }
    } on PlatformException catch (e) {
      AppOverlayLoader.hide();
      if (e.code == GoogleSignIn.kNetworkError && context.mounted) {
        context.showSnackBar(context.appLocalization.networkError, duration: 8);
      } else {
        if (context.mounted) {
          context.showSnackBar(context.appLocalization.generalError);
        }
      }
      debugPrint("AppleSignInException:: $e");
    } catch (e) {
      AppOverlayLoader.hide();
      debugPrint("AppleSignInException:: $e");
    } finally {
      AppOverlayLoader.hide();
    }
  }

  String generateNonce([int length = 32]) {
    const charset = '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = math.Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)]).join();
  }

  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

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
    return NashmiScaffold(
      body: Form(
        key: _formKey,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              collapsedHeight: 230,
              backgroundColor: Colors.transparent,
              actions: widget.showGuestButton
                  ? [
                      GuestButton(
                        onTap: () {
                          _signInAnonymously(context);
                        },
                      ),
                    ]
                  : null,
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
                    StretchedButton(
                      onPressed: () {
                        _signInWithPhoneNum(context);
                      },
                      margin: const EdgeInsets.only(top: 30),
                      child: Text(
                        context.appLocalization.welcome,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: context.colorPalette.white,
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
                                  context.navigate((context) => const CreateAccountScreen());
                                },
                                child: Text(
                                  context.appLocalization.createAccount,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: context.colorPalette.red018,
                                  ),
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
                          onPressed: () {
                            _signInWithApple(context);
                          },
                          icon: const CustomSvg(MyIcons.apple),
                        ),
                        IconButton(
                          onPressed: () {
                            _signInWithGoogle(context);
                          },
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
