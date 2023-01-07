import 'package:demoflutter/data/models/movie_model.dart';
import 'package:demoflutter/pages/movieInfo/movie_info_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:demoflutter/generated/l10n.dart';
import 'package:demoflutter/widgets/demo_icon_button.dart';
import 'package:demoflutter/widgets/demo_dialog.dart';
import 'package:demoflutter/widgets/demo_backdrop_clipper.dart';
import 'package:demoflutter/data/repository/api_configuration.dart';
import 'package:demoflutter/gen/assets.gen.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:demoflutter/pages/movieInfo/movie_info_viewmodel_provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class DemoMovieInfo extends HookConsumerWidget {
  final MovieModel movie;

  const DemoMovieInfo({super.key, required this.movie});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mv = ref.watch(movieInfoViewModelProvider.select((value) => value.movie));
    final state = ref.watch(movieInfoViewModelProvider.select((value) => value.state));

    if (state == PageState.loadingData) {
      EasyLoading.show(status: 'loading...');
    } else {
      EasyLoading.dismiss();
    }

    void onClickReviews() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return DemoDialog(
            title: "Demo Flutter",
            content: "Coming soon!",
            onClickOK: () {},
          );
        },
      );
    }

    void onClickTrailers() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return DemoDialog(
            title: "Demo Flutter",
            content: "Coming soon!",
            onClickOK: () {},
          );
        },
      );
    }

    Future<void> pullToRefresh() async {
      ref.read(movieInfoViewModelProvider).getMovieInfo(movie);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).movieDetail, style: const TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: pullToRefresh,
        child: ListView.separated(
          padding: const EdgeInsets.all(2),
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            switch (index) {
              case 0:
                return HeaderMovieView(
                  movie: movie,
                  genre: mv?.genres,
                );
              case 1:
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DemoButton(
                      text: S.of(context).reviews,
                      icon: Assets.images.icReview.path,
                      onClick: onClickReviews,
                      size: Size((MediaQuery.of(context).size.width - 20) / 2, 60),
                    ),
                    Container(
                      width: 1,
                      height: 60,
                      color: Colors.black12,
                    ),
                    DemoButton(
                      text: S.of(context).trailers,
                      icon: Assets.images.icTrailers.path,
                      onClick: onClickTrailers,
                      size: Size((MediaQuery.of(context).size.width - 20) / 2, 60),
                    ),
                  ],
                );
              case 2:
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DemoInfoView(title: S.of(context).genre, info: mv?.genres?.first.name ?? "--"),
                    DemoInfoView(title: S.of(context).release, info: movie.releaseDate),
                  ],
                );
              default:
                return Flex(direction: Axis.horizontal, children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(movie.overview,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black54)),
                    ),
                  )
                ]);
            }
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        ),
      ),
    );
  }
}

class DemoInfoView extends HookConsumerWidget {
  const DemoInfoView({super.key, required this.title, required this.info});

  final String title;
  final String info;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: (MediaQuery.of(context).size.width - 20) / 2,
      height: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Text(info, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black54)),
          )
        ],
      ),
    );
  }
}

class HeaderMovieView extends HookConsumerWidget {
  final MovieModel? movie;
  final List<GenreModel>? genre;

  const HeaderMovieView({super.key, this.movie, this.genre});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 300,
          child: ClipPath(
              clipper: CustomBackDropLayout(),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.25,
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage("${APIConfiguration.cdnURL}/t/p/w400/${movie?.backdropPath}"),
                  ),
                ),
              )),
        ),
        Positioned(
            left: 20,
            bottom: 70,
            child: Container(
              width: 120,
              height: 160,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(0, 2) // changes position of shadow
                      ),
                ],
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage("${APIConfiguration.cdnURL}/t/p/w400/${movie?.posterPath}"),
                ),
              ),
            )),
        Positioned(
          left: 10,
          right: 10,
          bottom: 0,
          height: 60,
          child: SizedBox(
            height: 50,
            child: Row(children: [
              Expanded(
                flex: 1,
                child: Text(
                  movie?.title ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
              ),
              SizedBox(
                width: 50,
                height: 50,
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    CircularPercentIndicator(
                      radius: 18.0,
                      lineWidth: 5.0,
                      progressColor: Colors.black54,
                      fillColor: Colors.white,
                      backgroundColor: Colors.black38,
                      percent: (movie?.voteAverage ?? 0.0) / 10.0,
                      center: Text('${movie?.voteAverage ?? 0}'),
                    )
                  ]),
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
