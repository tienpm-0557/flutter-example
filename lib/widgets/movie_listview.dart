import 'package:flutter/material.dart';
import 'package:demoflutter/data/models/movie_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:demoflutter/pages/movies/movies_viewmodel_provider.dart';
import 'package:demoflutter/pages/movies/movies_viewmodel.dart';
import 'package:demoflutter/widgets/loading_item.dart';
import 'package:demoflutter/widgets/movie_item.dart';
import 'package:demoflutter/widgets/empty_data.dart';
import 'package:demoflutter/generated/l10n.dart';

class MoviesList extends HookConsumerWidget {
  const MoviesList({super.key, required this.movies, required this.onSelectedItem});

  final List<MovieModel> movies;
  final ValueChanged<MovieModel> onSelectedItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(moviesViewModelProvider.select((value) => value.state));

    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: movies.isEmpty ? 1 : movies.length,
      itemBuilder: (BuildContext context, int index) {
        if (movies.isEmpty) {
          return EmptyDataView(content: S.of(context).noData);
        }
        if (index == movies.length - 1) {
          ref.read(moviesViewModelProvider).getMovies();
          if (state == ListState.loadingMore || state == ListState.loadingData) {
            return const LoadingItem();
          }
        }
        return MoviesItem(movie: movies[index], itemHeight: 160, onSelected: onSelectedItem);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
