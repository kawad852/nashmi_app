import 'package:flutter/material.dart';
import 'package:nashmi_app/controllers/phone_controller.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/enums.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/custom_back.dart';
import 'package:nashmi_app/widgets/custom_svg.dart';
import 'package:nashmi_app/widgets/custom_text.dart';
import 'package:nashmi_app/widgets/editors/text_editor.dart';
import 'package:nashmi_app/widgets/nashmi_scaffold.dart';
import 'package:nashmi_app/widgets/phone_field.dart';
import 'package:nashmi_app/widgets/stretch_button.dart';
import 'package:nashmi_app/widgets/titled_textfield.dart';

class ContactScreen extends StatefulWidget {
  final ContactType contactType;
  const ContactScreen({super.key, required this.contactType});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  late PhoneController phoneController;
  ContactType get _contactType => widget.contactType;

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

  String getTitle() {
    switch (_contactType) {
      case ContactType.ads:
        return context.appLocalization.toContactNashmiMarket;
      case ContactType.complaints:
        return context.appLocalization.forComplaints;
    }
  }

  String getDescription() {
    switch (_contactType) {
      case ContactType.ads:
        return context.appLocalization.fillInfoToContactYou;
      case ContactType.complaints:
        return context.appLocalization.fillComplaintToContactYou;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NashmiScaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              centerTitle: true,
              leadingWidth: kBarLeadingWith,
              leading: const CustomBack(),
              title: CustomText(
                _contactType == ContactType.ads ? context.appLocalization.advertiseWithUs : context.appLocalization.complaintsAndSuggestions,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 13),
                    CustomText(
                      getTitle(),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      getDescription(),
                    ),
                    const SizedBox(height: 20),
                    TitledTextField(
                      title: context.appLocalization.whatYourName,
                      child: TextEditor(
                        initialValue: null,
                        hintText: context.appLocalization.nameHintText,
                        onChanged: (value) {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TitledTextField(
                        title: context.appLocalization.yourPhoneNumber,
                        child: PhoneField(
                          controller: phoneController,
                        ),
                      ),
                    ),
                    TitledTextField(
                      title: context.appLocalization.title,
                      child: TextEditor(
                        initialValue: null,
                        hintText: _contactType == ContactType.ads ? context.appLocalization.messageTitle : context.appLocalization.yourComplaintOrSuggestion,
                        onChanged: (value) {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TitledTextField(
                        title: context.appLocalization.yourMessage,
                        child: TextEditor(
                          initialValue: null,
                          maxLines: 6,
                          hintText: context.appLocalization.writeYourMessageHere,
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => {},
                          child: Container(
                            width: 48,
                            height: 48,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: context.colorPalette.greyF2F,
                              borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
                            ),
                            child: const CustomSvg(MyIcons.attach),
                          ),
                        ),
                        const SizedBox(width: 15),
                        CustomText(
                          context.appLocalization.attachPicturesOrFiles,
                        ),
                      ],
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
                        context.appLocalization.send,
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
