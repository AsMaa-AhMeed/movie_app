import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:movie_app/presentation/manager/color_manager.dart';
import 'package:movie_app/presentation/manager/strings_manager.dart';
import 'package:movie_app/presentation/manager/values_manager.dart';
import 'package:movie_app/presentation/widgets/custom_text_form_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  DateTime? _myDateTime;
  String gender = 'Genger';
  String language = '';
  String birthDate = 'Birth Date';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: appBarSection(
        context,
        StringManager.editProfile,
      ),
      body: ListView(
        children: [
          Form(
            child: Column(
              children: [
                const CustomTextFormField(
                  hint: 'Andrew Ainsley',
                  textInputType: TextInputType.name,
                ),
                const CustomTextFormField(
                  hint: 'Andrew',
                  textInputType: TextInputType.name,
                ),
                CustomTextFormField(
                    hint: birthDate,
                    textInputType: TextInputType.datetime,
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today_outlined),
                      iconSize: AppSize.s16,
                      color: ColorManager.darkBlack,
                      onPressed: () async {
                        _myDateTime = await showDatePicker(
                            context: context,
                            initialDate: _myDateTime == null
                                ? DateTime.now()
                                : _myDateTime!,
                            firstDate: DateTime(2010),
                            lastDate: DateTime(2025));
                        setState(() {
                          birthDate =
                              DateFormat('dd-MM-yyyy').format(_myDateTime!);
                        });
                      },
                    )),
                const CustomTextFormField(
                    hint: 'Email',
                    textInputType: TextInputType.emailAddress,
                    suffixIcon: Icon(
                      Icons.email,
                      size: AppSize.s20,
                    )),
                CustomTextFormField(
                  hint: language,
                  suffixIcon: PopupMenuButton(
                    icon: const Icon(Icons.arrow_drop_down_rounded),
                    iconSize: AppSize.s40,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s15)),
                    itemBuilder: (context) {
                      return <PopupMenuEntry<String>>[
                        const PopupMenuItem(
                            value: 'egypt', child: Text('Egypt')),
                        const PopupMenuItem(
                            value: 'united states',
                            child: Text('United States')),
                      ];
                    },
                    onSelected: (value) {
                      setState(() {
                        language = value;
                      });
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: AppSize.s12),
                  margin: const EdgeInsets.symmetric(horizontal: AppSize.s16),
                  child: IntlPhoneField(
                    disableLengthCheck: true,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    initialCountryCode: 'IN',
                    onChanged: (phone) {},
                  ),
                ),
                CustomTextFormField(
                  hint: gender,
                  suffixIcon: PopupMenuButton(
                    icon: const Icon(Icons.arrow_drop_down_rounded),
                    iconSize: 40,
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
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSize.s30),
          Container(
              width: double.infinity,
              margin: const EdgeInsets.all(AppSize.s14),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: AppSize.s0,
                      padding: const EdgeInsets.all(AppSize.s14),
                      shape: const StadiumBorder()),
                  child: Text(StringManager.update,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: ColorManager.white))))
        ],
      ),
    );
  }
}

AppBar appBarSection(BuildContext context, String title) {
  return AppBar(
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: ColorManager.darkBlack,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    title: Text(
      title,
      style: Theme.of(context)
          .textTheme
          .titleLarge
          ?.copyWith(color: ColorManager.darkBlack),
    ),
  );
}
