import 'package:demoflutter/models/movie_model.dart';

abstract class MoviesRepository {
  Future<List<MovieModel>> fetchMovies(int page);

  Future<List<MovieDetailModel>> getMovieDetail(String? movieId);
}
