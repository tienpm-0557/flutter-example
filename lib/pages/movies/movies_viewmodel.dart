import 'package:demoflutter/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:demoflutter/pages/movies/movies_usecase.dart';

enum ListState { normal, loadingData, loadingMore, noLoadmore }

class MoviesPageViewModel extends ChangeNotifier {
  final FetchMoviesUseCase _moviesUseCase;
  AsyncValue<List<MovieModel>> movies = const AsyncValue.loading();

  MoviesPageViewModel({required FetchMoviesUseCase moviesUseCase}) : _moviesUseCase = moviesUseCase {
    getMovies();
  }

  ListState _state = ListState.normal;

  ListState get state => _state;
  void setListState(ListState newValue, bool needNotifi) {
    _state = newValue;
    if (needNotifi) {
      notifyListeners();
    }
  }

  int _totalItems = 0;

  int get totalItems => _totalItems;

  void refreshMovies() async {
    if (movies.value != null) {
      (movies.value as List<MovieModel>).clear();
    }
    setListState(ListState.normal, true);
    getMovies();
  }

  void getMovies() async {
    if (state == ListState.loadingData || state == ListState.loadingMore || state == ListState.noLoadmore) {
      return;
    }
    var page = 1;
    List<MovieModel> items = movies.value != null ? (movies.value as List<MovieModel>) : [];
    if (items.isNotEmpty) {
      page = (items.length ~/ 20).toInt() + 1;
    }

    setListState(ListState.loadingData, false);
    if (page > 1) {
      setListState(ListState.loadingMore, false);
    }
    notifyListeners();

    final result = await _moviesUseCase.fetchMovies(page);
    items.addAll(result);
    _totalItems = items.length;

    setListState(ListState.normal, false);
    if (result.length < 20) {
      setListState(ListState.noLoadmore, false);
    }
    movies = AsyncValue.data(items);
    notifyListeners();
  }
}
