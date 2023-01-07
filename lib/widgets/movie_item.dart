import 'package:flutter/material.dart';
import 'package:demoflutter/data/models/movie_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:demoflutter/data/repository/api_configuration.dart';

class MoviesItem extends HookConsumerWidget {
  const MoviesItem({super.key, required this.movie, required this.itemHeight, required this.onSelected});

  final MovieModel movie;
  final double itemHeight;
  final ValueChanged<MovieModel> onSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
        onTap: () => onSelected(movie),
        child: SizedBox(
          height: itemHeight,
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                height: itemHeight - 10,
                margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage("${APIConfiguration.cdnURL}/t/p/w200/${movie.posterPath}"),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    height: itemHeight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                            child: Text(
                              movie.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                            )),
                        Text(
                          movie.overview,
                          style: const TextStyle(fontSize: 15),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                        ),
                      ],
                    )),
              )
            ],
          ),
        ));
  }
}
