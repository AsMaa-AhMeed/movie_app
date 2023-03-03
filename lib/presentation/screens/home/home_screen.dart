import 'package:flutter/material.dart';
import 'package:movie_app/data/dummy_data.dart';
import 'package:movie_app/presentation/manager/color_manager.dart';
import 'package:movie_app/presentation/manager/strings_manager.dart';
import 'package:movie_app/presentation/manager/styles_manager.dart';
import 'package:movie_app/presentation/manager/values_manager.dart';
import 'package:movie_app/presentation/screens/screens.dart';
import 'package:movie_app/presentation/widgets/movie_section_widget.dart';
import 'package:movie_app/presentation/widgets/shared_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
            backgroundColor: Colors.transparent,
            toolbarHeight: 300,
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                padding: EdgeInsets.all(10),
                height: 300,
                decoration: const BoxDecoration(
                  //   color: Color(0xff7c94b6),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://lumiere-a.akamaihd.net/v1/images/p_avengersendgame_19751_e14a0104.jpeg?region=0%2C0%2C540%2C810'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                        onTap: () {},
                        child: Container(
                            height: AppSize.s40,
                            width: AppSize.s110,
                            decoration: const BoxDecoration(
                                color: ColorManager.primaryColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(AppSize.s20),
                                )),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Icon(Icons.play_circle_fill_outlined,
                                      color: Colors.white, size: AppSize.s25),
                                  Text(StringManager.play,
                                      style: getBoldStyle(
                                          color: ColorManager.white,
                                          fontSize: AppSize.s20))
                                ]))),
                    const SizedBox(width: AppSize.s20),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: AppSize.s40,
                        width: AppSize.s130,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: AppSize.s2, color: ColorManager.white),
                            borderRadius: const BorderRadius.all(
                                Radius.circular(AppSize.s20))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.add,
                                color: ColorManager.white, size: AppSize.s25),
                            Text(StringManager.myList,
                                style: getBoldStyle(
                                    color: ColorManager.white,
                                    fontSize: AppSize.s20))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(height: AppSize.s5),
              titleSection(
                StringManager.topMoviesThisWeek,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => SeeAllMoviesScreen(
                            movieList: topMoviesThisWeek,
                            title: StringManager.topMoviesThisWeek,
                          ))));
                },
              ),
              MovieSectionWidget(movieList: topMoviesThisWeek),
              const SizedBox(height: AppSize.s5),
              titleSection(
                StringManager.newReleases,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => SeeAllMoviesScreen(
                            movieList: newReleases,
                            title: StringManager.newReleases,
                          ))));
                },
              ),
              MovieSectionWidget(movieList: newReleases),
            ],
          ),
        )
      ],
    ));
  }
}
