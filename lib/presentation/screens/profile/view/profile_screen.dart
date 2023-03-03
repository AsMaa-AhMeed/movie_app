import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:movie_app/presentation/manager/color_manager.dart';
import 'package:movie_app/presentation/manager/strings_manager.dart';
import 'package:movie_app/presentation/manager/values_manager.dart';
import 'package:movie_app/presentation/screens/profile/view/edit_profile_screen.dart';
import 'package:movie_app/presentation/screens/profile/view/notification_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(StringManager.profile,
              style: Theme.of(context).textTheme.displayMedium)),
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView(children: [
        _showCirclerImage(
            imageUrl:
                'https://vivolabs.es/wp-content/uploads/2022/03/perfil-hombre-vivo.png'),
        const SizedBox(height: AppSize.s10),
        Center(
          child: Text('Andrew Ainsley',
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  ?.copyWith(color: ColorManager.darkBlack)),
        ),
        const SizedBox(height: AppSize.s5),
        Center(
            child: Text('+1 11114564832',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: ColorManager.darkBlack))),
        const SizedBox(height: AppSize.s10),
        const Divider(
            endIndent: AppSize.s15,
            indent: AppSize.s15,
            color: ColorManager.lightGray),
        _editSection(
            icon: Icons.person,
            data: StringManager.editProfile,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const EditProfileScreen();
                },
              ));
            }),
        _editSection(
            icon: Icons.notifications,
            data: StringManager.notification,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const NotificationScreen();
                },
              ));
            }),
        _editSection(
            icon: Icons.system_update_tv_outlined,
            data: StringManager.dowunload),
        _editSection(
            icon: Icons.security_rounded, data: StringManager.security),
        _editSection(
            icon: Icons.g_translate_rounded, data: StringManager.language),
        Padding(
          padding: const EdgeInsets.only(left: AppSize.s8),
          child: ListTile(
            visualDensity: const VisualDensity(vertical: -1),
            leading: const Icon(
              Icons.remove_red_eye_outlined,
              color: ColorManager.lightBlack,
            ),
            title: const Text(StringManager.darkMode,
                style: TextStyle(
                    fontSize: AppSize.s18, fontWeight: FontWeight.w500)),
            trailing: SizedBox(
              height: AppSize.s40,
              width: AppSize.s50,
              child: FlutterSwitch(
                height: 27,
                width: 44,
                value: isSwitched,
                inactiveColor: ColorManager.lightGray,
                activeColor: ColorManager.primaryColor,
                onToggle: (bool value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
            ),
          ),
        ),
        _editSection(
            icon: Icons.help_center_outlined, data: StringManager.helpCenter),
        _editSection(
            icon: Icons.logout_rounded,
            iconColor: ColorManager.error,
            textColor: ColorManager.error,
            data: StringManager.logout),
      ]),
    );
  }

  Widget _editSection(
      {required IconData? icon,
      required String data,
      Color? iconColor,
      Color? textColor = ColorManager.darkBlack,
      VoidCallback? onPressed}) {
    return Padding(
      padding: const EdgeInsets.only(left: AppSize.s8),
      child: ListTile(
        visualDensity: const VisualDensity(vertical: -1),
        leading: Icon(
          icon,
          color: iconColor,
        ),
        title: Text(data,
            style: TextStyle(
                color: textColor,
                fontSize: AppSize.s18,
                fontWeight: FontWeight.w500)),
        trailing: IconButton(
          icon: const Icon(
            Icons.arrow_forward_ios_rounded,
            size: AppSize.s16,
            color: ColorManager.lightBlack,
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }

  Widget _showCirclerImage({required String imageUrl}) {
    return Stack(alignment: Alignment.center, children: [
      CircleAvatar(
          backgroundImage: NetworkImage(imageUrl), radius: AppSize.s70),
      Positioned(
          right: 115,
          bottom: 1,
          child: IconButton(
            onPressed: () {},
            icon: roundedButton(
                child: const Icon(Icons.edit,
                    color: ColorManager.white, size: AppSize.s20),
                all: AppSize.s4,
                color: ColorManager.primaryColor),
          ))
    ]);
  }

  Widget roundedButton({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      Container(
        padding: EdgeInsets.all(all),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s7), color: color),
        child: child,
      );
}
