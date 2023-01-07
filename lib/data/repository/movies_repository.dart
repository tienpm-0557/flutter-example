import 'package:demoflutter/data/models/movie_model.dart';

abstract class MoviesRepository {
  Future<List<MovieModel>> fetchMovies(int page);

  Future<MovieDetailModel?> getMovieDetail(int movieId);

}
