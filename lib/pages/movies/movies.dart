import 'package:demoflutter/pages/movies/movies_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:demoflutter/pages/movies/movies_viewmodel_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:demoflutter/generated/l10n.dart';
import 'package:demoflutter/widgets/movie_listview.dart';
import 'package:demoflutter/pages/MovieInfo/movie_info.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class DemoMoviespage extends HookConsumerWidget {
  final String title;

  const DemoMoviespage({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(moviesViewModelProvider.select((value) => value.movies));
    final total = ref.watch(moviesViewModelProvider.select((value) => value.totalItems));
    final listState = ref.watch(moviesViewModelProvider.select((value) => value.state));
    final viewModel = ref.read(moviesViewModelProvider);

    if (listState == ListState.loadingMore || listState == ListState.loadingData) {
      EasyLoading.show(status: 'loading...');
    } else {
      EasyLoading.dismiss();
    }
    void didSelectedItem(movie) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => DemoMovieInfo(movie: movie)));
    }

    Future<void> pullToRefresh() async {
      viewModel.refreshMovies();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${S.of(context).Popular} ($total)', style: const TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.logout, color: Colors.red), tooltip: S.of(context).logout, onPressed: () {})
        ],
      ),
      body: RefreshIndicator(
        onRefresh: pullToRefresh,
        child: movies.when(
          data: (data) {
              return MoviesList(
                movies: data,
                onSelectedItem: didSelectedItem,
              );
          },
          error: (error, stackTrace) => Center(child: Text("Oops! ${error.toString()}")),
          loading: () => const Center(child: Text("Loading")),
        ),
      ),
    );
  }
}
