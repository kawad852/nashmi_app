import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:nashmi_app/alerts/feedback/app_feedback.dart';
import 'package:nashmi_app/controllers/phone_controller.dart';
import 'package:nashmi_app/helper/my_factory.dart';
import 'package:nashmi_app/helper/storage_service.dart';
import 'package:nashmi_app/models/contact/contact_model.dart';
import 'package:nashmi_app/network/api_service.dart';
import 'package:nashmi_app/network/fire_queries.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/dimensions.dart';
import 'package:nashmi_app/utils/enums.dart';
import 'package:nashmi_app/widgets/custom_text.dart';
import 'package:nashmi_app/widgets/editors/text_editor.dart';
import 'package:nashmi_app/widgets/nashmi_scaffold.dart';
import 'package:nashmi_app/widgets/phone_field.dart';
import 'package:nashmi_app/widgets/stretch_button.dart';
import 'package:nashmi_app/widgets/titled_textfield.dart';
import 'package:nashmi_app/widgets/user_selector.dart';
import 'package:share_plus/share_plus.dart';

import '../../alerts/loading/app_over_loader.dart';
import '../../utils/app_constants.dart';

class ContactScreen extends StatefulWidget {
  final ContactType contactType;

  const ContactScreen({
    super.key,
    required this.contactType,
  });

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  late PhoneController _phoneController;
  ContactType get _contactType => widget.contactType;
  late ContactModel _contact;
  final storageService = StorageService();
  XFile? _file;
  final _formKey = GlobalKey<FormState>();

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      context.unFocusKeyboard();

      switch (_contactType) {
        case ContactType.ad:
        case ContactType.complaints:
          _sendEmail(context);
        case ContactType.join:
          _sendRequest(context);
      }
    }
  }

  void _sendRequest(BuildContext context) {
    _contact.phoneCountryCode = _phoneController.countryCode;
    _contact.phoneNum = _phoneController.phoneNum;
    ApiService.fetch(
      context,
      callBack: () async {
        _contact.id = MyFactory.generateId;
        await FirebaseFirestore.instance.providerRequests.doc(_contact.id).set(_contact);
        _leave();
      },
    );
  }

  void _sendEmail(BuildContext context) {
    _contact.phoneCountryCode = _phoneController.getDialCode();
    _contact.phoneNum = _phoneController.phoneNum;
    ApiService.fetch(
      context,
      callBack: () async {
        // if (_file != null) {
        //   _contact.imageURL = await storageService.uploadFile(collection: "users_photos", file: _file!);
        // }
        try {
          AppOverlayLoader.show();
          const url = 'https://api.emailjs.com/api/v1.0/email/send';
          Uri uri = Uri.parse(url);
          var headers = {
            'Content-Type': 'application/json',
            'origin': 'http://localhost',
          };
          var body = jsonEncode({
            'service_id': EmailJsEnum.serviceId,
            'template_id': EmailJsEnum.templateId,
            'user_id': EmailJsEnum.userId,
            'template_params': {
              'user_name': _contact.displayName,
              // 'user_email': emailCtrl.text,
              'user_subject': _contact.subject,
              'user_message': "${_contact.message}",
              'user_phone': "📱 ${_contact.phoneCountryCode}${_contact.phoneNum}",
              'type': _contactType.name,
            },
          });
          debugPrint("Response:: CheckoutResponse\nUrl:: $url\nheaders:: ${headers.toString()}");
          http.Response response = await http.post(uri, headers: headers, body: body);
          debugPrint("CheckoutStatusCode:: ${response.statusCode} CheckoutBody:: ${response.body}");
          AppOverlayLoader.hide();
          if (response.statusCode == 200) {
            if (context.mounted) {
              _leave();
            }
          } else {
            if (context.mounted) {
              context.showSnackBar(context.appLocalization.generalError);
            }
          }
        } catch (e) {
          debugPrint("$e");
          AppOverlayLoader.hide();
          if (context.mounted) {
            context.showSnackBar(context.appLocalization.generalError);
          }
        }
      },
    );
  }

  void _leave() {
    context.showSnackBar(context.appLocalization.sentSuccessfully);
    Navigator.pop(context);
  }

  String getHeader() {
    switch (_contactType) {
      case ContactType.ad:
        return context.appLocalization.advertiseWithUs;
      case ContactType.complaints:
        return context.appLocalization.complaintsAndSuggestions;
      case ContactType.join:
        return context.appLocalization.joinNashmi(context.appLocalization.appName);
    }
  }

  String getTitle() {
    switch (_contactType) {
      case ContactType.ad:
        return context.appLocalization.toContactNashmiMarket;
      case ContactType.complaints:
        return context.appLocalization.forComplaints;
      case ContactType.join:
        return context.appLocalization.joinNashmiTitle;
    }
  }

  String getDescription() {
    switch (_contactType) {
      case ContactType.ad:
        return context.appLocalization.fillInfoToContactYou;
      case ContactType.complaints:
        return context.appLocalization.fillComplaintToContactYou;
      case ContactType.join:
        return context.appLocalization.joinNashmiBody;
    }
  }

  @override
  void initState() {
    super.initState();
    _contact = ContactModel();
    _phoneController = PhoneController(context);
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return UserSelector(builder: (context, user) {
      _contact.displayName ??= user?.displayName;
      _contact.phoneCountryCode ??= user?.phoneCountryCode;
      _contact.phoneNum ??= user?.phone;
      return NashmiScaffold(
        appBar: AppBar(
          centerTitle: true,
          title: CustomText(
            getHeader(),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: StretchedButton(
            onPressed: () {
              _onSubmit();
            },
            child: CustomText(
              context.appLocalization.send,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: context.colorPalette.white,
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
                    initialValue: _contact.displayName,
                    hintText: context.appLocalization.nameHintText,
                    onChanged: (value) => _contact.displayName = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TitledTextField(
                    title: context.appLocalization.yourPhoneNumber,
                    child: PhoneField(
                      controller: _phoneController,
                    ),
                  ),
                ),
                TitledTextField(
                  title: context.appLocalization.title,
                  child: TextEditor(
                    initialValue: _contact.subject,
                    hintText: _contactType == ContactType.ad ? context.appLocalization.messageTitle : context.appLocalization.yourComplaintOrSuggestion,
                    onChanged: (value) => _contact.subject = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TitledTextField(
                    title: context.appLocalization.yourMessage,
                    child: TextEditor(
                      initialValue: _contact.message,
                      maxLines: 6,
                      hintText: context.appLocalization.writeYourMessageHere,
                      onChanged: (value) => _contact.message = value,
                    ),
                  ),
                ),
                // Row(
                //   children: [
                //     GestureDetector(
                //       onTap: () => {},
                //       child: Container(
                //         width: 48,
                //         height: 48,
                //         alignment: Alignment.center,
                //         decoration: BoxDecoration(
                //           color: context.colorPalette.greyF2F,
                //           borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
                //         ),
                //         child: const CustomSvg(MyIcons.attach),
                //       ),
                //     ),
                //     const SizedBox(width: 15),
                //     CustomText(
                //       context.appLocalization.attachPicturesOrFiles,
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
