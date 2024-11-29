import 'package:flutter/material.dart';
import 'package:nashmi_app/controllers/phone_controller.dart';
import 'package:nashmi_app/screens/profile/widgets/edit_image_bubble.dart';
import 'package:nashmi_app/screens/registration/widgets/gender_card.dart';
import 'package:nashmi_app/utils/app_constants.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/custom_back.dart';
import 'package:nashmi_app/widgets/custom_network_image.dart';
import 'package:nashmi_app/widgets/custom_text.dart';
import 'package:nashmi_app/widgets/editors/password_editor.dart';
import 'package:nashmi_app/widgets/editors/text_editor.dart';
import 'package:nashmi_app/widgets/nashmi_scaffold.dart';
import 'package:nashmi_app/widgets/phone_field.dart';
import 'package:nashmi_app/widgets/stretch_button.dart';
import 'package:nashmi_app/widgets/titled_textfield.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late PhoneController phoneController;
  bool _isMale = true;
  String? _password;
  String? _newPassword;
  String? _confirmNewPassword;
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
    return Scaffold(
      body: NashmiScaffold(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              centerTitle: true,
              leadingWidth: kBarLeadingWith,
              leading: const CustomBack(),
              title: CustomText(
                context.appLocalization.editAccount,
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
                    Center(
                      child: CustomNetworkImage(
                        kFakeImage,
                        margin: const EdgeInsets.symmetric(vertical: 16),
                        width: 90,
                        height: 90,
                        alignment: AlignmentDirectional.bottomCenter,
                        radius: MyTheme.radiusSecondary,
                        child: EditImageBubble(
                          onTap: () {},
                        ),
                      ),
                    ),
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
                    CustomText(
                      context.appLocalization.maleOrFemale,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          GenderCard(
                            onTap: () {
                              setState(() {
                                _isMale = true;
                              });
                            },
                            icon: MyIcons.male,
                            title: context.appLocalization.male,
                            isSelected: _isMale,
                          ),
                          const SizedBox(width: 10),
                          GenderCard(
                            onTap: () {
                              setState(() {
                                _isMale = false;
                              });
                            },
                            icon: MyIcons.female,
                            title: context.appLocalization.female,
                            isSelected: !_isMale,
                          ),
                        ],
                      ),
                    ),
                    TitledTextField(
                      title: context.appLocalization.yourPassword,
                      child: PasswordEditor(
                        initialValue: null,
                        onChanged: (value) => _password = value,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TitledTextField(
                        title: context.appLocalization.yourNewPassword,
                        child: PasswordEditor(
                          initialValue: null,
                          onChanged: (value) => _newPassword = value,
                        ),
                      ),
                    ),
                    TitledTextField(
                      title: context.appLocalization.confirmNewPassword,
                      child: PasswordEditor(
                        initialValue: null,
                        isConfirm: true,
                        password: _newPassword,
                        onChanged: (value) => _confirmNewPassword = value,
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
                    StretchedButton(
                      onPressed: () {},
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: CustomText(
                        context.appLocalization.saveModifications,
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
