import 'package:flutter/material.dart';
import 'package:nashmi_app/screens/profile/widgets/profile_bubble.dart';
import 'package:nashmi_app/screens/profile/widgets/user_info.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
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
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          pinned: true,
          backgroundColor: Colors.transparent,
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  onTap: () {},
                ),
                ProfileBubble(
                  icon: MyIcons.terms,
                  title: context.appLocalization.termsAndConditions,
                  onTap: () {},
                ),
                ProfileBubble(
                  icon: MyIcons.policy,
                  title: context.appLocalization.privacyPolicy,
                  onTap: () {},
                ),
                ProfileBubble(
                  icon: MyIcons.chat,
                  title: context.appLocalization.talkToNashmi,
                  onTap: () {},
                ),
                ProfileBubble(
                  icon: MyIcons.sms,
                  title: context.appLocalization.advertiseWithUs,
                  onTap: () {},
                ),
                ProfileBubble(
                  icon: MyIcons.danger,
                  title: context.appLocalization.complaintsAndSuggestions,
                  onTap: () {},
                ),
                ProfileBubble(
                  icon: MyIcons.sms,
                  title: context.appLocalization.participateNashmiMarket,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
