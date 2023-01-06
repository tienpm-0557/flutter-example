import 'package:demoflutter/repository/movies_repository.dart';
import 'package:demoflutter/models/movie_model.dart';
import 'package:flutter/material.dart';

class FetchMoviesUseCase extends ChangeNotifier {
  final MoviesRepository _moviesRepository;

  FetchMoviesUseCase({required MoviesRepository repository}) : _moviesRepository = repository;

  Future<List<MovieModel>> fetchMovies(int page) {
    return _moviesRepository.fetchMovies(page);
  }

  Future<List<MovieDetailModel>> getMovieDetail() {
    return _moviesRepository.getMovieDetail('xxx');
  }
}
