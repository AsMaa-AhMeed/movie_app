import 'package:movie_app/models/onboarding_model.dart';
import 'package:movie_app/presentation/manager/assets_manager.dart';
import 'package:movie_app/presentation/manager/strings_manager.dart';

List<OnBoardindgModel> onboardingList = [
  OnBoardindgModel(
      imageUrl: ImageAsset.onBoardingSvg1,
      title: StringManager.onBoarding1Title,
      subTitle: StringManager.onBoarding1Text),
  OnBoardindgModel(
      imageUrl: ImageAsset.onBoardingSvg2,
      title: StringManager.onBoarding1Title,
      subTitle: StringManager.onBoarding2Text),
  OnBoardindgModel(
      imageUrl: ImageAsset.onBoardingSvg3,
      title: StringManager.onBoarding1Title,
      subTitle: StringManager.onBoarding3Text),
];
