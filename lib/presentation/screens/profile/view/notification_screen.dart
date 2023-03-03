import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:movie_app/presentation/manager/color_manager.dart';
import 'package:movie_app/presentation/manager/strings_manager.dart';
import 'package:movie_app/presentation/manager/values_manager.dart';
import 'package:movie_app/presentation/screens/profile/view/edit_profile_screen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: appBarSection(context, StringManager.notification),
      body: Column(children: [
        _editNotification(data: StringManager.generalNotification),
        _editNotification(data: StringManager.sound),
        _editNotification(data: StringManager.vibrate),
        _editNotification(data: StringManager.specialOffers),
        _editNotification(data: StringManager.promoAndDiscount),
        _editNotification(data: StringManager.payment),
        _editNotification(data: StringManager.cashback),
        _editNotification(data: StringManager.appUpdates),
        _editNotification(data: StringManager.newServiceAvailable),
        _editNotification(data: StringManager.newTipsAvailable),
      ]),
    );
  }

  _editNotification({
    required String data,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: AppSize.s8),
      child: ListTile(
        title: Text(data,
            style: const TextStyle(
                color: ColorManager.lightBlack,
                fontSize: AppSize.s18,
                fontWeight: FontWeight.w500)),
        trailing: SizedBox(
          height: AppSize.s50,
          width: AppSize.s50,
          child: FlutterSwitch(
            height: AppSize.s25,
            width: 48,
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
    );
  }
}
