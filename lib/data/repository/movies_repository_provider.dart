
import 'package:demoflutter/data/repository/movies_repository_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:demoflutter/data/repository/movies_repository.dart';

final movieRepositoryProvider = Provider<MoviesRepository>(
      (ref) => MoviesRepositoryImpl(),
);