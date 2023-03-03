import 'package:flutter/material.dart';
import 'package:movie_app/presentation/manager/assets_manager.dart';
import 'package:movie_app/presentation/manager/color_manager.dart';
import 'package:movie_app/presentation/manager/routes_manager.dart';
import 'package:movie_app/presentation/manager/strings_manager.dart';
import 'package:movie_app/presentation/manager/values_manager.dart';
import 'package:movie_app/presentation/widgets/custom_text_form_field.dart';
import 'package:movie_app/presentation/widgets/social_authentication_button/icon_authentication_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isRememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(children: [
          Image.asset(
            ImageAsset.appLogoImage,
            height: AppSize.s100,
          ),
          const SizedBox(height: AppSize.s40),
          Center(
              child: Text(
            StringManager.createYourAccount,
            style: Theme.of(context).textTheme.displayMedium,
          )),
          const SizedBox(height: AppSize.s30),
          const CustomTextFormField(
            prefixIcon: Icon(Icons.email_rounded, color: ColorManager.grey),
            hint: StringManager.email,
            textInputType: TextInputType.emailAddress,
          ),
          const CustomTextFormField(
            prefixIcon: Icon(Icons.lock_rounded, color: ColorManager.grey),
            suffixIcon:
                Icon(Icons.remove_red_eye_rounded, color: ColorManager.grey),
            hint: StringManager.password,
            textInputType: TextInputType.visiblePassword,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Checkbox(
                value: isRememberMe,
                onChanged: changeIsRememberMeState,
                fillColor: MaterialStateProperty.all(ColorManager.primaryColor),
              ),
              const Text(StringManager.rememberMe)
            ],
          ),
          const SizedBox(height: AppSize.s10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: AppSize.s20),
            height: AppSize.s50,
            width: double.infinity,
            child: Visibility(
                replacement: const Center(
                  child: CircularProgressIndicator(),
                ),
                child: ElevatedButton(
                    onPressed: () {}, child: const Text(StringManager.signUp))),
          ),
          const SizedBox(height: AppSize.s40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Expanded(child: Divider(indent: AppSize.s20)),
              SizedBox(width: AppSize.s20),
              Text(StringManager.orContinueWith,
                  style: TextStyle(color: ColorManager.lightBlack)),
              SizedBox(width: AppSize.s20),
              Expanded(child: Divider(endIndent: AppSize.s20)),
            ],
          ),
          const SizedBox(height: AppSize.s20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              IconAuthenticationButton(iconPath: ImageAsset.facebookLogoSvg),
              SizedBox(width: AppSize.s20),
              IconAuthenticationButton(iconPath: ImageAsset.googleLogoSvg),
              SizedBox(width: AppSize.s20),
              IconAuthenticationButton(iconPath: ImageAsset.appleLogoSvg),
            ],
          ),
          const SizedBox(height: AppSize.s20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                StringManager.alreadyHaveAnAccount,
                style: TextStyle(color: ColorManager.grey),
              ),
              TextButton(
                onPressed: navigateToLoginScreen,
                child: const Text(
                  StringManager.signIn,
                  style: TextStyle(color: ColorManager.primaryColor),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }

  void navigateToLoginScreen() {
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }

  void changeIsRememberMeState(bool? value) {
    setState(() {
      isRememberMe = value ?? false;
    });
  }
}
