import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/presentation/manager/assets_manager.dart';
import 'package:movie_app/presentation/manager/color_manager.dart';
import 'package:movie_app/presentation/manager/routes_manager.dart';
import 'package:movie_app/presentation/manager/strings_manager.dart';
import 'package:movie_app/presentation/manager/values_manager.dart';
import 'package:movie_app/presentation/widgets/social_authentication_button/social_authentication_button.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Theme.of(context).backgroundColor,
        body: ListView(physics: const BouncingScrollPhysics(), children: [
          SvgPicture.asset(ImageAsset.authLogoSvg, height: AppSize.s230),
          Center(
              child: Text(StringManager.letsYouIn,
                  style: Theme.of(context).textTheme.displayLarge)),
          Padding(
              padding: const EdgeInsets.all(AppSize.s20),
              child: Column(children: [
                Column(children: const <Widget>[
                  SocialAuthenticationButton(
                      platformName: StringManager.facebook,
                      iconPath: ImageAsset.facebookLogoSvg),
                  SizedBox(height: AppSize.s10),
                  SocialAuthenticationButton(
                      platformName: StringManager.google,
                      iconPath: ImageAsset.googleLogoSvg),
                  SizedBox(height: AppSize.s10),
                  SocialAuthenticationButton(
                      platformName: StringManager.apple,
                      iconPath: ImageAsset.appleLogoSvg)
                ]),
                const SizedBox(height: AppSize.s30),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Expanded(child: Divider()),
                      SizedBox(width: AppSize.s20),
                      Text(StringManager.or),
                      SizedBox(width: AppSize.s20),
                      Expanded(child: Divider())
                    ]),
                const SizedBox(height: AppSize.s20),
                SizedBox(
                    width: double.infinity,
                    height: AppSize.s50,
                    child: ElevatedButton(
                        onPressed: navigateToSignInScreen,
                        child: const Text(StringManager.signInWithEmail))),
                const SizedBox(height: AppSize.s20),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        StringManager.haveAnAccount,
                        style: TextStyle(color: ColorManager.grey),
                      ),
                      TextButton(
                          onPressed: navigateToSignUpScreen,
                          child: const Text(StringManager.signUp,
                              style:
                                  TextStyle(color: ColorManager.primaryColor)))
                    ])
              ]))
        ]));
  }

  navigateToSignInScreen() {
    Navigator.pushNamed(context, Routes.loginRoute);
  }

  navigateToSignUpScreen() {
    Navigator.pushNamed(context, Routes.registerRoute);
  }
}
