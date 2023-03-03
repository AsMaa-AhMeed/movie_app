import 'package:flutter/material.dart';
import 'package:movie_app/presentation/manager/strings_manager.dart';
import 'package:movie_app/presentation/manager/styles_manager.dart';
import 'package:movie_app/presentation/manager/values_manager.dart';

import '../manager/color_manager.dart';

titleSection(String txt, {VoidCallback? onTap}) {
  return ListTile(
      onTap: onTap,
      leading: Text(txt,
          textAlign: TextAlign.left,
          style: getSemiBoldStyle(
              color: ColorManager.lightBlack, fontSize: AppSize.s18)),
      trailing: Text(StringManager.seeAll,
          style: getSemiBoldStyle(color: ColorManager.primaryColor)));
}
