import 'package:flutter/material.dart';
import 'package:movie_app/presentation/manager/strings_manager.dart';
import 'package:movie_app/presentation/manager/values_manager.dart';

import '../screens.dart';

class NavigateScreen extends StatefulWidget {
  const NavigateScreen({super.key});

  @override
  State<NavigateScreen> createState() => _NavigateScreenState();
}

class _NavigateScreenState extends State<NavigateScreen> {
  int navigatIndex = 0;
  List items = const [
    HomeScreen(),
    ExploreScreen(),
    MyListScreen(),
    DowunloadScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: items[navigatIndex],
      bottomNavigationBar: Container(
        width: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppSize.s30),
              topRight: Radius.circular(AppSize.s30)),
        ),
        child: SizedBox(
          height: AppSize.s80,
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: AppSize.s0,
              currentIndex: navigatIndex,
              onTap: ((int index) {
                setState(() {
                  navigatIndex = index;
                });
              }),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined), label: StringManager.home),
                BottomNavigationBarItem(
                    icon: Icon(Icons.explore), label: StringManager.explore),
                BottomNavigationBarItem(
                    icon: Icon(Icons.bookmark_border_rounded),
                    label: StringManager.myList),
                BottomNavigationBarItem(
                    icon: Icon(Icons.system_update_tv_outlined),
                    label: StringManager.dowunload),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline),
                    label: StringManager.profile),
              ]),
        ),
      ),
    );
  }
}
