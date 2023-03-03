import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/models/onboarding_model.dart';
import 'package:movie_app/presentation/manager/color_manager.dart';
import 'package:movie_app/presentation/manager/styles_manager.dart';
import 'package:movie_app/presentation/manager/values_manager.dart';

class BuildBoardingItem extends StatelessWidget {
  final OnBoardindgModel onBoardindgModel;
  const BuildBoardingItem({super.key, required this.onBoardindgModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.s20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SvgPicture.asset(onBoardindgModel.imageUrl),
          Text(onBoardindgModel.title,
              style: getBoldStyle(
                  color: ColorManager.darkBlack, fontSize: AppSize.s30)),
          const SizedBox(height: AppSize.s14),
          Text(onBoardindgModel.subTitle,
              textAlign: TextAlign.center,
              style: getRegularStyle(
                  color: ColorManager.darkBlack, fontSize: AppSize.s14)),
          const SizedBox(height: AppSize.s10),
        ],
      ),
    );
  }
}
