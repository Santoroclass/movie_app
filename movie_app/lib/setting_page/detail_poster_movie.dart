import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieaddict/screens/WatchLaterPage/watch_later_screen.dart';
import 'package:movieaddict/services/hive_service.dart';
import 'package:movieaddict/styles/color.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailsPosterWidget extends StatelessWidget {
  final String movieCnName,
      movieEnName,
      movieRating,
      releaseMovieTime,
      moviePoster,
      movieImdbRating,
      movieDuration,
      movieTrailer,
      movieId,
      movieIntroduction;
  final List moviePhotos, actors, locationsWithMovietimes, movieCategory;
  const DetailsPosterWidget(
      {Key key,
      @required this.movieCnName,
      @required this.movieEnName,
      @required this.movieRating,
      @required this.releaseMovieTime,
      @required this.moviePoster,
      @required this.moviePhotos,
      @required this.actors,
      @required this.locationsWithMovietimes,
      @required this.movieImdbRating,
      @required this.movieDuration,
      @required this.movieCategory,
      @required this.movieTrailer,
      @required this.movieId,
      @required this.movieIntroduction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String randomMoviePhoto;
    Color _color;
    List<Color> _categoryColorList = [];

    Future<void> _launch({String url}) async {
      if (!await canLaunch(url)) {
        await launch(
          url,
        );
      } else {
        throw 'Could not launch $url';
      }
    }

    Future<void> _launchInBrowser(String url) async {
      final bool nativeAppLaunchSucceeded = await launch(
        url,
        forceSafariVC: false,
        universalLinksOnly: true,
      );
      if (!nativeAppLaunchSucceeded) {
        await launch(
          url,
          forceSafariVC: true,
        );
      }
    }

    void movieCategoryColor(List movieCategory) {
      for (var movie = 0; movie < movieCategory.length; movie++) {
        switch (movieCategory[movie]) {
          case '動畫':
            _color = Colors.purple;
            _categoryColorList.add(_color);
            continue;
          case '紀錄片':
            _color = Colors.green;
            _categoryColorList.add(_color);
            continue;
          case '愛情':
            _color = Colors.pink;
            _categoryColorList.add(_color);
            continue;
          case '喜劇':
            _color = Colors.yellow;
            _categoryColorList.add(_color);
            continue;
          case '科幻':
          case '奇幻':
            _color = Colors.blue[900];
            _categoryColorList.add(_color);
            continue;

          case '動作':
          case '冒險':
            _color = Colors.orange;
            _categoryColorList.add(_color);
            continue;
          case '懸疑/驚悚':
          case '犯罪':
          case '戰爭':
            _color = Colors.black87;
            _categoryColorList.add(_color);
            continue;

          case '恐怖':
            _color = Colors.red;
            _categoryColorList.add(_color);
            continue;
          default:
            _color = const Color(0xff9B9B9B);
            _categoryColorList.add(_color);
        }
      }
    }

    void moviePhotosRandomPick(List moviePhotos) {
      var randomItem = moviePhotos;
      randomMoviePhoto = (randomItem..shuffle()).first;
    }

    if (moviePhotos.isNotEmpty) {
      moviePhotosRandomPick(moviePhotos);
    }
    movieCategoryColor(movieCategory);
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        //Background shader image
        GestureDetector(
          onTap: () =>
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailsFullScreen(
              moviePhotos:
                  moviePhotos.isNotEmpty ? moviePhotos[0] : moviePoster,
              tag: '2',
            );
          })),
          child: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [mainDarkColor, Colors.white],
            ).createShader(bounds),
            child: Hero(
              tag: '2',
              child: SizedBox(
                child: CachedNetworkImage(
                  imageUrl:
                      moviePhotos.isNotEmpty ? randomMoviePhoto : moviePoster,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                          child: SizedBox(
                              width: 100,
                              height: 100,
                              child: CircularProgressIndicator(
                                  value: downloadProgress.progress))),
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0xff000000),
                            offset: Offset(1, 4),
                            blurRadius: 4.0,
                            spreadRadius: -1),
                      ],
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                width: size.width,
                height: 412,
              ),
            ),
          ),
        ),
        Positioned(
          top: 30,
          left: 15,
          right: 15,
          child: SizedBox(
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: Color(0xffF5F5F5),
                  ),
                  iconSize: 30,
                ),
                BookmarkIcon(
                  movieId: movieId,
                  movieCnName: movieCnName,
                  movieEnName: movieEnName,
                  movieRating: movieRating,
                  movieImdbRating: movieImdbRating,
                  movieDuration: movieDuration,
                  movieIntroduction: movieIntroduction,
                  movieTrailer: movieTrailer,
                  moviePoster: moviePoster,
                  releaseMovieTime: releaseMovieTime,
                  movieCategory: movieCategory,
                  moviePhotos: moviePhotos,
                  actors: actors,
                  iconSize: 30,
                  iconColor: const Color(0xffF5F5F5),
                )
              ],
            ),
          ),
        ),