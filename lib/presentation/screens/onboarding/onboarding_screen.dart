import 'package:flutter/material.dart';
import 'package:movie_app/data/onboarding_data.dart';
import 'package:movie_app/presentation/manager/color_manager.dart';
import 'package:movie_app/presentation/manager/routes_manager.dart';
import 'package:movie_app/presentation/manager/strings_manager.dart';
import 'package:movie_app/presentation/manager/values_manager.dart';
import 'package:movie_app/presentation/widgets/build_boarding_Item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardindgScreen extends StatefulWidget {
  OnBoardindgScreen({super.key});

  @override
  State<OnBoardindgScreen> createState() => _OnBoardindgScreenState();
}

class _OnBoardindgScreenState extends State<OnBoardindgScreen> {
  final PageController boardController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(children: [
          SizedBox(
            height: AppSize.s700,
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: boardController,
              itemBuilder: (context, index) =>
                  BuildBoardingItem(onBoardindgModel: onboardingList[index]),
              itemCount: onboardingList.length,
            ),
          ),
          SmoothPageIndicator(
              controller: boardController,
              count: onboardingList.length,
              effect: const ExpandingDotsEffect(
                  dotColor: ColorManager.grey,
                  activeDotColor: ColorManager.primaryColor,
                  dotHeight: AppSize.s8,
                  dotWidth: AppSize.s8,
                  spacing: AppSize.s5,
                  expansionFactor: AppSize.s4)),
          Container(
              height: AppSize.s50,
              margin: const EdgeInsets.fromLTRB(
                  AppSize.s14, AppSize.s20, AppSize.s14, AppSize.s0),
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: navigateToAuthenticationScreen,
                  child: const Text(StringManager.getStarted)))
        ]));
  }

  void navigateToAuthenticationScreen() {
    Navigator.pushReplacementNamed(context, Routes.authenticationRoute);
  }
}
