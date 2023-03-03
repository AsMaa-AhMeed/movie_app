import 'package:flutter/material.dart';
import 'package:movie_app/presentation/manager/strings_manager.dart';
import 'package:movie_app/presentation/screens/onboarding/onboarding_screen.dart';

import '../screens/screens.dart';

class Routes {
  static const String splashRoute = '/';
  static const String onBoardingRoute = '/onBoarding';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String authenticationRoute = '/authentication';
  static const String accountSetupRoute = '/accountSetup';
  static const String forgetPasswordRoute = '/forgetPassword';
  static const String homeRoute = '/home';
  static const String exploreRoute = '/explore';
  static const String profileRoute = '/profile';
  static const String navigationRoute = '/navigation';
  static const String myListRoute = '/myList';
  static const String downloadRoute = '/download';
  static const String notificationRoute = '/notification';
  static const String editProfileRoute = '/editProfile';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardindgScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case Routes.authenticationRoute:
        return MaterialPageRoute(builder: (_) => const AuthenticationScreen());
      case Routes.accountSetupRoute:
        return MaterialPageRoute(builder: (_) => const AccountSetupScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.exploreRoute:
        return MaterialPageRoute(builder: (_) => const ExploreScreen());
      case Routes.profileRoute:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case Routes.navigationRoute:
        return MaterialPageRoute(builder: (_) => const NavigateScreen());
      case Routes.myListRoute:
        return MaterialPageRoute(builder: (_) => const MyListScreen());
      case Routes.downloadRoute:
        return MaterialPageRoute(builder: (_) => const DowunloadScreen());
      case Routes.notificationRoute:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      case Routes.editProfileRoute:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
            appBar: AppBar(title: const Text(StringManager.notRoutefound)),
            body: const Center(child: Text(StringManager.notRoutefound))));
  }
}
