import 'package:flutter/material.dart';
import 'package:movie_app/presentation/manager/color_manager.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: const Center(
          child: Text(
        'Explore Screen',
        style: TextStyle(fontSize: 30, color: ColorManager.primaryColor),
      )),
    );
  }
}
