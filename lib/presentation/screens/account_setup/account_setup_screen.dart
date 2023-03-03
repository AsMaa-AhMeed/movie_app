import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:movie_app/presentation/manager/color_manager.dart';
import 'package:movie_app/presentation/manager/routes_manager.dart';
import 'package:movie_app/presentation/manager/strings_manager.dart';
import 'package:movie_app/presentation/manager/values_manager.dart';
import 'package:movie_app/presentation/widgets/custom_text_form_field.dart';

class AccountSetupScreen extends StatefulWidget {
  const AccountSetupScreen({super.key});

  @override
  State<AccountSetupScreen> createState() => _AccountSetupScreenState();
}

class _AccountSetupScreenState extends State<AccountSetupScreen> {
  String gender = 'Genger';
  String birthDate = 'Birth Date';
  File? file;
  XFile? _image;

  Future _pickImage(bool imageFrom) async {
    try {
      _image = await ImagePicker().pickImage(
          source: imageFrom ? ImageSource.camera : ImageSource.gallery);

      if (_image != null) {
        final temporaryImage = File(_image!.path);
        setState(() {
          _image = temporaryImage as XFile?;
        });
      }
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
          title: Text(StringManager.fillYourProfile,
              style: Theme.of(context).textTheme.displayMedium)),
      body: ListView(children: [
        const SizedBox(height: AppSize.s20),
        file != null
            ? CircleAvatar(
                backgroundColor: Colors.grey[100],
                radius: AppSize.s70,
                backgroundImage: Image.file(file!).image)
            : _showCirclerImage(),
        const SizedBox(height: AppSize.s20),
        Column(
          children: [
            const CustomTextFormField(
              hint: StringManager.firstName,
              textInputType: TextInputType.name,
            ),
            const CustomTextFormField(
              hint: StringManager.lastName,
              textInputType: TextInputType.name,
            ),
            const CustomTextFormField(
                hint: StringManager.email,
                textInputType: TextInputType.emailAddress,
                suffixIcon: Icon(Icons.email, color: ColorManager.grey)),
            Container(
                padding: const EdgeInsets.symmetric(vertical: AppSize.s12),
                margin: const EdgeInsets.symmetric(horizontal: AppSize.s16),
                child: IntlPhoneField(
                    disableLengthCheck: true,
                    decoration: const InputDecoration(
                        labelText: StringManager.phoneNumber,
                        labelStyle: TextStyle(color: ColorManager.grey),
                        border: OutlineInputBorder(borderSide: BorderSide())),
                    initialCountryCode: 'IN',
                    onChanged: (phone) {})),
            CustomTextFormField(
                hint: gender,
                suffixIcon: PopupMenuButton(
                    icon: const Icon(Icons.arrow_drop_down_rounded,
                        color: ColorManager.grey),
                    iconSize: AppSize.s40,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s15)),
                    itemBuilder: (context) {
                      return <PopupMenuEntry<String>>[
                        const PopupMenuItem(value: 'male', child: Text('Male')),
                        const PopupMenuItem(
                            value: 'female', child: Text('Female')),
                      ];
                    },
                    onSelected: (value) {
                      setState(() {
                        gender = value;
                      });
                    })),
            const SizedBox(height: AppSize.s60),
            Row(
              children: [
                Container(
                  width: AppSize.s190,
                  height: AppSize.s60,
                  padding: const EdgeInsets.fromLTRB(
                      AppSize.s18, AppSize.s0, AppSize.s0, AppSize.s10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.lightRed),
                      onPressed: navigateToNavigationScreen,
                      child: const Text(
                        StringManager.skip,
                        style: TextStyle(color: ColorManager.primaryColor),
                      )),
                ),
                Container(
                  width: AppSize.s200,
                  height: AppSize.s60,
                  padding: const EdgeInsets.fromLTRB(
                      AppSize.s14, AppSize.s0, AppSize.s14, AppSize.s10),
                  child: ElevatedButton(
                      onPressed: navigateToNavigationScreen,
                      child: const Text(StringManager.continueTxt)),
                ),
              ],
            ),
          ],
        ),
      ]),
    );
  }

  showImageSource() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () {
                _pickImage(true);
                Navigator.pop(context);
              }),
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text('Gallery'),
            onTap: () {
              _pickImage(false);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _showCirclerImage() {
    return Stack(alignment: Alignment.center, children: [
      CircleAvatar(
          backgroundColor: ColorManager.lightGray,
          radius: AppSize.s60,
          child:
              Icon(Icons.person, size: AppSize.s80, color: Colors.grey[300])),
      Positioned(
          right: 124,
          bottom: 1,
          child: IconButton(
            onPressed: showImageSource,
            icon: roundedButton(
                child: const Icon(Icons.edit,
                    color: ColorManager.white, size: AppSize.s16),
                all: AppSize.s4,
                color: ColorManager.primaryColor),
          ))
    ]);
  }

  void navigateToNavigationScreen() {
    Navigator.pushReplacementNamed(context, Routes.navigationRoute);
  }

  Widget roundedButton({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      Container(
        padding: EdgeInsets.all(all),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(7), color: color),
        child: child,
      );
}
