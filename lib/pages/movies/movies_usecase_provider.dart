
import 'package:demoflutter/pages/movies/movies_usecase.dart';
import 'package:demoflutter/repository/movies_repository_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final fetchMoviesProvider = ChangeNotifierProvider<FetchMoviesUseCase>(
      (ref) => FetchMoviesUseCase(repository: ref.watch(movieRepositoryProvider))
);


