import 'package:flutter/material.dart';
import 'package:nashmi_app/screens/contact/contact_screen.dart';
import 'package:nashmi_app/screens/policy/policy_screen.dart';
import 'package:nashmi_app/screens/profile/widgets/profile_bubble.dart';
import 'package:nashmi_app/screens/profile/widgets/user_info.dart';
import 'package:nashmi_app/utils/app_constants.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/enums.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/widgets/custom_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          children: [
            const UserInfo(),
            const SizedBox(height: 20),
            CustomText(
              context.appLocalization.list,
              fontSize: 16,
              fontWeight: FontWeight.bold,
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
}
