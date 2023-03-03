import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/presentation/manager/color_manager.dart';
import 'package:movie_app/presentation/manager/values_manager.dart';

class MovieSectionWidget extends StatelessWidget {
  final List<MovieModel> movieList;
  const MovieSectionWidget({super.key, required this.movieList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: AppSize.s200,
        child: ListView.builder(
            itemCount: movieList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Container(
                    margin: const EdgeInsets.all(AppSize.s5),
                    height: AppSize.s200,
                    width: 135,
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
                                color: ColorManager.white,
                                fontSize: AppSize.s12),
                          )))
                    ])),
              );
            }));
  }
}
