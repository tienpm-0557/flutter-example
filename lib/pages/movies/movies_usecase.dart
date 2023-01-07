import 'package:demoflutter/data/repository/movies_repository.dart';
import 'package:demoflutter/data/models/movie_model.dart';
import 'package:flutter/material.dart';

class FetchMoviesUseCase extends ChangeNotifier {
  final MoviesRepository _moviesRepository;

  FetchMoviesUseCase({required MoviesRepository repository}) : _moviesRepository = repository;

  Future<List<MovieModel>> fetchMovies(int page) {
    return _moviesRepository.fetchMovies(page);
  }

  Future<MovieDetailModel?> getMovieDetail(int movieId) {
    return _moviesRepository.getMovieDetail(movieId);
  }
}
