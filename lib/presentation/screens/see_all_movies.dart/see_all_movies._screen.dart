import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/presentation/manager/color_manager.dart';
import 'package:movie_app/presentation/manager/values_manager.dart';

class SeeAllMoviesScreen extends StatelessWidget {
  final List<MovieModel> movieList;
  final String title;
  const SeeAllMoviesScreen(
      {super.key, required this.movieList, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          //crossAxisSpacing: 5,
          childAspectRatio: .79,
        ),
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.s10),
              child: Stack(alignment: Alignment.topLeft, children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(AppSize.s20),
                    child: Image.network(movieList[index].imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 240)),
                Container(
                    width: AppSize.s40,
                    height: AppSize.s25,
                    padding: const EdgeInsets.all(AppSize.s5),
                    margin: const EdgeInsets.all(AppSize.s12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.s5),
                        color: ColorManager.primaryColor),
                    child: Center(
                        child: Text(
                      movieList[index].rate,
                      style: const TextStyle(
                          color: ColorManager.white, fontSize: AppSize.s12),
                    )))
              ]));
        },
      ),
    );
  }
}
