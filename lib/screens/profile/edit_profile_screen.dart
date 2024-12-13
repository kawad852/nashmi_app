import 'package:flutter/material.dart';
import 'package:nashmi_app/alerts/feedback/app_feedback.dart';
import 'package:nashmi_app/controllers/phone_controller.dart';
import 'package:nashmi_app/models/user/user_model.dart';
import 'package:nashmi_app/network/api_service.dart';
import 'package:nashmi_app/screens/profile/widgets/edit_image_bubble.dart';
import 'package:nashmi_app/screens/registration/widgets/gender_card.dart';
import 'package:nashmi_app/utils/app_constants.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/dimensions.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/utils/providers_extension.dart';
import 'package:nashmi_app/widgets/custom_network_image.dart';
import 'package:nashmi_app/widgets/custom_text.dart';
import 'package:nashmi_app/widgets/editors/text_editor.dart';
import 'package:nashmi_app/widgets/nashmi_scaffold.dart';
import 'package:nashmi_app/widgets/phone_field.dart';
import 'package:nashmi_app/widgets/stretch_button.dart';
import 'package:nashmi_app/widgets/titled_textfield.dart';
import 'package:nashmi_app/widgets/user_selector.dart';

import '../../utils/enums.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  PhoneController? phoneController;
  UserModel? user;
  final _formKey = GlobalKey<FormState>();

  void _onSave(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      ApiService.fetch(
        context,
        callBack: () async {
          await context.userProvider.userDocRef.update(user!.toJson());
          if (context.mounted) {
            Navigator.pop(context);
            context.showSnackBar(context.appLocalization.successfullyUpdated);
          }
        },
      );
    }
  }

  @override
  void dispose() {
    phoneController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return UserSelector(
      builder: (context, u) {
        if (u == null) {
          return const SizedBox.shrink();
        }
        user ??= UserModel.fromJson(u.toJson());
        phoneController ??= PhoneController(context, phoneNum: user?.phone, countryCode: user?.phoneCountryCode);
        return NashmiScaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              context.appLocalization.editAccount,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: StretchedButton(
              onPressed: () {
                _onSave(context);
              },
              child: Text(
                context.appLocalization.saveModifications,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: context.colorPalette.white,
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(kScreenMargin),
            child: Form(
              key: _formKey,
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
                      initialValue: user?.displayName,
                      hintText: context.appLocalization.nameHintText,
                      onChanged: (value) => user?.displayName = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: TitledTextField(
                      title: context.appLocalization.yourPhoneNumber,
                      child: PhoneField(
                        controller: phoneController!,
                        readOnly: true,
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
                              user!.gender = GenderType.male.value;
                            });
                          },
                          icon: MyIcons.male,
                          title: context.appLocalization.male,
                          isSelected: user!.gender == GenderType.male.value,
                        ),
                        const SizedBox(width: 10),
                        GenderCard(
                          onTap: () {
                            setState(() {
                              user!.gender = GenderType.female.value;
                            });
                          },
                          icon: MyIcons.female,
                          title: context.appLocalization.female,
                          isSelected: user!.gender == GenderType.female.value,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
