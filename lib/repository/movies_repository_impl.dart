import 'package:demoflutter/models/movie_model.dart';
import 'package:demoflutter/repository/movies_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:demoflutter/repository/api_configuration.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  @override
  Future<List<MovieModel>> fetchMovies(int page) async {
    debugPrint('DEBUG::: Start fetchMovies with page - $page');
    try {
      var response = await Dio().get(
          '${APIConfiguration.rootURL}/3/movie/popular?api_key=${APIConfiguration.privateKey}&language=${APIConfiguration.lang}&page=$page');
      final movieResponse = MoviesReponse.fromJson(response.data);
      return movieResponse.results;
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  Future<List<MovieDetailModel>> getMovieDetail(String? movieId) async {
    debugPrint("Start getMovieDetail");
    return [];
  }
}
