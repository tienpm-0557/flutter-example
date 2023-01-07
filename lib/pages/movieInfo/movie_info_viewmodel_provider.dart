import 'package:demoflutter/data/models/movie_model.dart';
import 'package:demoflutter/pages/movies/movies_usecase_provider.dart';
import 'package:demoflutter/pages/movieInfo/movie_info_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final movieInfoViewModelProvider = ChangeNotifierProvider<MovieInfoPageViewModel>(
  (ref) => MovieInfoPageViewModel(moviesUseCase: ref.watch(fetchMoviesProvider)),
);
