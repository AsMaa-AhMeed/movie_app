import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/presentation/manager/assets_manager.dart';
import 'package:movie_app/presentation/manager/color_manager.dart';
import 'package:movie_app/presentation/manager/strings_manager.dart';
import 'package:movie_app/presentation/manager/values_manager.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({super.key});

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(title: const Text(StringManager.myList), actions: const [
        Padding(
          padding: EdgeInsets.all(AppSize.s14),
          child: Icon(
            Icons.search_rounded,
            size: AppSize.s30,
          ),
        )
      ]),
      body: Padding(
        padding: const EdgeInsets.only(top: AppSize.s100),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(ImageAsset.searchLogoSvg, height: AppSize.s230),
              const Text(
                StringManager.yourListIsEmpty,
                style: TextStyle(
                    fontSize: AppSize.s24,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.primaryColor),
              ),
              const SizedBox(height: AppSize.s20),
              Text(StringManager.yourListIsEmpty2,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6)
            ],
          ),
        ),
      ),
    );
  }
}
