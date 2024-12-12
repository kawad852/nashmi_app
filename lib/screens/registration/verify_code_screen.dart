import 'dart:convert';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:nashmi_app/alerts/feedback/app_feedback.dart';
import 'package:nashmi_app/models/user/user_model.dart';
import 'package:nashmi_app/network/api_service.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/dimensions.dart';
import 'package:nashmi_app/utils/enums.dart';
import 'package:nashmi_app/utils/providers_extension.dart';
import 'package:nashmi_app/widgets/custom_text.dart';
import 'package:nashmi_app/widgets/editors/base_editor.dart';
import 'package:nashmi_app/widgets/nashmi_scaffold.dart';
import 'package:nashmi_app/widgets/stretch_button.dart';

import '../../models/otp_model.dart';

class VerifyCodeScreen extends StatefulWidget {
  final UserModel user;
  final bool isLogin;

  const VerifyCodeScreen({
    super.key,
    required this.user,
    required this.isLogin,
  });

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  String? _otp;

  UserModel get user => widget.user;

  Future<void> _verify(
    BuildContext context, {
    bool isLogin = true,
  }) async {
    ApiService.fetch(
      context,
      callBack: () async {
        // final response = await http.post(
        //   Uri.parse('https://api.doverifyit.com/api/otp-check/9698951871'),
        //   headers: {
        //     'Content-Type': 'application/json',
        //     "Authorization": "553|qsZhFQf91vSH5eMnmvQCI1oNwrmT01O7PQEgn4gjJSv6d10xSvMVIIeoX2L1",
        //   },
        //   body: jsonEncode({
        //     "otp": "$_otp",
        //   }),
        // );

        // final body = OtpModel.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
        await Future.delayed(const Duration(seconds: 1));
        var response = http.Response(jsonEncode(OtpModel().toJson()), 200);
        final body = OtpModel.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
        if (response.statusCode == 200 && context.mounted) {
          final uid = context.getToken(user.phoneCountryCode!, user.phone!);
          var callable = FirebaseFunctions.instanceFor(region: "europe-west3").httpsCallable('createUser');
          final results = await callable.call(<String, dynamic>{
            'uid': uid,
          });
          final data = results.data as Map<String, dynamic>;
          final customToken = data['token'];
          final auth = await FirebaseAuth.instance.signInWithCustomToken(customToken);
          if (context.mounted) {
            context.userProvider.register(
              context,
              auth,
              provider: AuthProviders.phone,
              guestRoute: null,
            );
          }
        } else if (context.mounted) {
          context.showSnackBar(body.message ?? context.appLocalization.generalError);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NashmiScaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
        ),
        bottomNavigationBar: BottomAppBar(
          child: StretchedButton(
            onPressed: () {
              if (_otp == null || _otp!.length < 6) {
                Fluttertoast.showToast(msg: context.appLocalization.enterOtp);
                return;
              }
              _verify(context);
            },
            child: CustomText(
              context.appLocalization.enterTheCode,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: context.colorPalette.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(kScreenMargin),
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
                        color: context.colorPalette.red018,
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
                child: BaseEditor(
                  textAlign: TextAlign.center,
                  hintText: context.appLocalization.codeHintText,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (value) => _otp = value,
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
                        color: context.colorPalette.red018,
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
    );
  }
}
