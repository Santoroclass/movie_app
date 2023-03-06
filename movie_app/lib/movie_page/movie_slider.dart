import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieaddict/screens/DetailsPage/details_screen.dart';
import 'package:movieaddict/widgets/HomePage/home_animation_text_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeSliderWidget extends StatefulWidget {
  final List sliderMoviesList;
  final List relatedMovieList;
  const HomeSliderWidget(
      {Key key, @required this.sliderMoviesList, this.relatedMovieList})
      : super(key: key);
  @override
  _HomeSliderWidgetState createState() => _HomeSliderWidgetState();
}

class _HomeSliderWidgetState extends State<HomeSliderWidget> {
  int currentPageValue = 0;
  Color _color;
  final List<Color> _categoryColorList = [];

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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    int index;
    return (widget.sliderMoviesList == null)
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(children: [
            SizedBox(
              width: size.width,
              // height: 350,
              child: Stack(alignment: Alignment.bottomRight, children: [
                CarouselSlider.builder(
                  itemCount: (widget.sliderMoviesList.length > 5)
                      ? 5
                      : widget.sliderMoviesList.length,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int unKnownIndex) {
                    index = itemIndex;
                    return GestureDetector(
                      // ignore: void_checks
                      onTap: () {
                        return Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (_, __, ___) => DetailsScreen(
                                      moviePoster: widget
                                          .sliderMoviesList[itemIndex]
                                          .moviePoster,
                                      moviePhotos: widget
                                          .sliderMoviesList[itemIndex]
                                          .moviePhotos,
                                      movieCnName: widget
                                          .sliderMoviesList[itemIndex]
                                          .movieCnName,
                                      movieEnName: widget
                                          .sliderMoviesList[itemIndex]
                                          .movieEnName,
                                      movieRating: widget
                                          .sliderMoviesList[itemIndex]
                                          .movieRating,
                                      releaseMovieTime: widget
                                          .sliderMoviesList[itemIndex]
                                          .releaseMovieTime,
                                      movieImdbRating: widget
                                          .sliderMoviesList[itemIndex]
                                          .movieImdbRating,
                                      movieDuration: widget
                                          .sliderMoviesList[itemIndex]
                                          .movieDuration,
                                      movieCategory: widget
                                          .sliderMoviesList[itemIndex]
                                          .movieCategory,
                                      actors: widget
                                          .sliderMoviesList[itemIndex].actors,
                                      movieTrailer: widget
                                          .sliderMoviesList[itemIndex]
                                          .movieTrailer,
                                      movieIntroduction: widget
                                          .sliderMoviesList[itemIndex]
                                          .movieIntroduction,
                                      relatedMovieList: widget.relatedMovieList,
                                      movieId: widget
                                          .sliderMoviesList[itemIndex].movieId,
                                    )));
                      },