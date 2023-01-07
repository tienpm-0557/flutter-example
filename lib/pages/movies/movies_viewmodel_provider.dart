import 'package:demoflutter/pages/movies/movies_usecase_provider.dart';
import 'package:demoflutter/pages/movies/movies_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final moviesViewModelProvider = ChangeNotifierProvider<MoviesPageViewModel>(
      (ref) => MoviesPageViewModel(moviesUseCase: ref.watch(fetchMoviesProvider)),
);
