import 'package:demoflutter/data/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:demoflutter/pages/movies/movies_usecase.dart';

enum PageState { normal, loadingData }

class MovieInfoPageViewModel extends ChangeNotifier {
  final FetchMoviesUseCase _movieInfoUseCase;

  MovieModel? _movie;

  MovieDetailModel? _movieDetail;

  MovieDetailModel? get movie => _movieDetail;

  PageState _state = PageState.normal;

  PageState get state => _state;

  void setState(PageState newValue, bool needNotifi) {
    _state = newValue;
    if (needNotifi) {
      notifyListeners();
    }
  }

  void setMovie(MovieModel mv) {
    _movie = mv;
    getMovieInfo();
  }

  MovieInfoPageViewModel({required FetchMoviesUseCase moviesUseCase}) : _movieInfoUseCase = moviesUseCase {}

  void getMovieInfo() async {
    if (_movie == null) {
      return;
    }
    setState(PageState.loadingData, true);
    final result = await _movieInfoUseCase.getMovieDetail(_movie!.id);
    _movieDetail = result;
    debugPrint('DEBUG::: $result');
    setState(PageState.normal, true);
  }
}
