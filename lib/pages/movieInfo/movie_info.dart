import 'package:demoflutter/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:demoflutter/generated/l10n.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:demoflutter/widgets/empty_data.dart';
import 'package:demoflutter/repository/api_configuration.dart';

class DemoMovieInfo extends HookConsumerWidget {
  final MovieModel movie;

  const DemoMovieInfo({super.key, required this.movie});

  Future<void> _pullRefresh() async {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.originalTitle, style: const TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _pullRefresh,
        child: ListView.separated(
          padding: const EdgeInsets.all(2),
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            switch (index) {
              case 0:
                return HeaderMovieView(
                  movie: movie,
                );
              case 1:
                return Expanded(
                    child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Column(children: [Text(movie?.title ?? '')])));
              case 2:
                return Expanded(
                    child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Row(children: const [
                          Text("AAAAAA"),
                          Text("BBBBBB"),
                        ])));
              default:
                return Expanded(
                    child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                    movie?.overview ?? '',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ));
            }
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        ),
      ),
    );
  }
}

class HeaderMovieView extends HookConsumerWidget {
  final MovieModel? movie;

  const HeaderMovieView({super.key, this.movie});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 300,
          child: ClipPath(
              clipper: CustomLayout(),
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
                    offset: Offset(0, 2), // changes position of shadow
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
          child: Container(
            width: MediaQuery.of(context).size.width * 0.25,
            height: 50,
            child: Expanded(
              child: Container(
                  height: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        movie?.title ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                    ],
                  )),
            ),
          ),
        )
      ],
    );
  }
}

class CustomLayout extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width * 0.0006000, size.height * 0.0062000);
    path0.lineTo(size.width * 0.9972000, size.height * 0.0079714);
    path0.lineTo(size.width * 0.9991667, size.height * 0.7814286);
    path0.lineTo(size.width * 0.0041667, size.height * 0.5014286);
    path0.lineTo(size.width * 0.0006000, size.height * 0.0062000);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
