import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nashmi_app/screens/contact/contact_screen.dart';
import 'package:nashmi_app/screens/policy/policy_screen.dart';
import 'package:nashmi_app/screens/profile/widgets/profile_bubble.dart';
import 'package:nashmi_app/screens/profile/widgets/user_info.dart';
import 'package:nashmi_app/screens/registration/registration_screen.dart';
import 'package:nashmi_app/utils/app_constants.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/enums.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/utils/providers_extension.dart';
import 'package:nashmi_app/widgets/stretch_button.dart';
import 'package:nashmi_app/widgets/user_selector.dart';

import '../../helper/launcher_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     final a = await FirebaseFirestore.instance.providers.where("geo", isNull: true).count().get();
      //     print("aaa ${a.count}");
      //   },
      // ),
      bottomNavigationBar: UserSelector(
        builder: (context, user) {
          final authenticated = user != null;
          return Offstage(
            offstage: authenticated,
            child: BottomAppBar(
              child: StretchedButton(
                child: Text(context.appLocalization.login),
                onPressed: () {
                  context.navigate(
                    (context) => const RegistrationScreen(
                      showGuestButton: false,
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          children: [
            const UserInfo(),
            const SizedBox(height: 20),
            Text(
              context.appLocalization.list,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ProfileBubble(
              icon: MyIcons.offersSelect,
              title: context.appLocalization.getKnowUs,
              onTap: () {
                context.navigate((context) => const PolicyScreen(id: PolicyDocuments.aboutUs));
              },
            ),
            ProfileBubble(
              icon: MyIcons.terms,
              title: context.appLocalization.termsAndConditions,
              onTap: () {
                context.navigate((context) => const PolicyScreen(id: PolicyDocuments.termsOfUse));
              },
            ),
            ProfileBubble(
              icon: MyIcons.policy,
              title: context.appLocalization.privacyPolicy,
              onTap: () {
                context.navigate((context) => const PolicyScreen(id: PolicyDocuments.privacyPolicy));
              },
            ),
            ProfileBubble(
              icon: MyIcons.chat,
              title: context.appLocalization.talkToNashmi,
              onTap: () {
                const number = "+962792207555";
                LauncherService.lunch(context, Platform.isAndroid ? "https://wa.me/$number/" : "https://api.whatsapp.com/send?phone=$number");
              },
            ),
            ProfileBubble(
              icon: MyIcons.sms,
              title: context.appLocalization.advertiseWithUs,
              onTap: () {
                context.push(const ContactScreen(contactType: ContactType.ad));
              },
            ),
            ProfileBubble(
              icon: MyIcons.danger,
              title: context.appLocalization.complaintsAndSuggestions,
              onTap: () {
                context.push(const ContactScreen(contactType: ContactType.complaints));
              },
            ),
            ProfileBubble(
              icon: MyIcons.sms,
              title: context.appLocalization.participateNashmiMarket,
              onTap: () {
                context.userProvider.handleGuest(
                  context,
                  action: () {
                    context.push(const ContactScreen(contactType: ContactType.join));
                  },
                );
              },
            ),
            UserSelector(
              builder: (context, user) {
                final isAuthenticated = user != null;
                return Visibility(
                  visible: isAuthenticated,
                  child: ProfileBubble(
                    icon: MyIcons.logout,
                    title: context.appLocalization.logout,
                    textColor: context.colorPalette.red018,
                    onTap: () {
                      context.userProvider.logout(context);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
