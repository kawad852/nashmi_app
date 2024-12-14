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
      bottomNavigationBar: BottomAppBar(
        child: UserSelector(
          builder: (context, user) {
            final authenticated = user != null;
            return StretchedButton(
              child: Text(authenticated ? context.appLocalization.logout : context.appLocalization.login),
              onPressed: () {
                if (authenticated) {
                  context.userProvider.logout(context);
                } else {
                  context.navigate((context) => const RegistrationScreen(
                        showGuestButton: false,
                      ));
                }
              },
            );
          },
        ),
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
              onTap: () {},
            ),
            ProfileBubble(
              icon: MyIcons.sms,
              title: context.appLocalization.advertiseWithUs,
              onTap: () {
                context.push(const ContactScreen(contactType: ContactType.ads));
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
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
