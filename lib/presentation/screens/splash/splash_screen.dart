import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/presentation/manager/assets_manager.dart';
import 'package:movie_app/presentation/manager/color_manager.dart';
import 'package:movie_app/presentation/manager/routes_manager.dart';
import 'package:movie_app/presentation/manager/strings_manager.dart';
import 'package:movie_app/presentation/manager/styles_manager.dart';
import 'package:movie_app/presentation/manager/values_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: AppSize.splashScreenDuration),
      () => navigateToonBoardingScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SizedBox(
            width: double.infinity,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(height: AppSize.s200),
              Center(
                  child: Image.asset(ImageAsset.appLogoImage,
                      height: AppSize.s100)),
              const SizedBox(height: AppSize.s20),
              Text(StringManager.appLogo,
                  style: getBoldStyle(
                      color: ColorManager.logoColor, fontSize: AppSize.s70)),
              const SizedBox(height: AppSize.s200),
              Lottie.asset(ImageAsset.appLogoAnimations, height: AppSize.s80)
            ])));
  }

  void navigateToonBoardingScreen() {
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }
}
