import 'package:flutter/material.dart';
import 'package:movie_app/presentation/manager/color_manager.dart';

class DowunloadScreen extends StatefulWidget {
  const DowunloadScreen({super.key});

  @override
  State<DowunloadScreen> createState() => _DowunloadScreenState();
}

class _DowunloadScreenState extends State<DowunloadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: const Center(
          child: Text(
        'Download Screen',
        style: TextStyle(fontSize: 30, color: ColorManager.primaryColor),
      )),
    );
  }
}
