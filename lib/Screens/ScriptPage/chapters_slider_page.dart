import 'package:google_fonts/google_fonts.dart';
import 'package:hadean_crew/Modules/chapters.dart';
import 'package:flutter/material.dart';
import 'package:hadean_crew/Screens/ScriptPage/chapter_details_page.dart';
import 'package:hadean_crew/Widgets/chapter_card.dart';

class AnimationSliderPage extends StatefulWidget {
  const AnimationSliderPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimationSliderPage> createState() => _AnimationSliderPageState();
}

class _AnimationSliderPageState extends State<AnimationSliderPage> {
  PageController? _pageController;
  int? _index;
  int? _auxIndex;
  double? _percent;
  double? _auxPercent;
  bool? _isScrolling;


  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _index = 0;
    _auxIndex = _index! + 1;
    _percent = 0.0;
    _auxPercent = 1.0 - _percent!;
    _isScrolling = false;
    _pageController!.addListener(_pageListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController!.removeListener(_pageListener);
    super.dispose();
  }

  // PAGE VIEW LISTENER
  void _pageListener() {
    _index = _pageController!.page!.floor();
    _auxIndex = _index! + 1;
    _percent = (_pageController!.page! - _index!).abs();
    _auxPercent = 1.0 - _percent!;
    _isScrolling = (_pageController!.page! % 1.0 != 0);
    setState(() {
      chapters = chapters;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title:  Text("Hadean", style: GoogleFonts.inconsolata(color: Colors.black, fontSize: 30),),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {Navigator.pop(context);},
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.black,
          ),
        ),
        body: Stack(
          children: [
            AnimatedPositioned(
              duration: kThemeAnimationDuration,
              top: 0,
              bottom: 0,
              right: _isScrolling! ? 10 : 0,
              left: _isScrolling! ? 10 : 0,
              child: Stack(children: [
                // BACK CARD
                Transform.translate(
                  offset: Offset(0, 50 * _auxPercent!.toDouble()),
                  child: ChapterCard(
                    chapter: chapters[
                    _auxIndex!.toInt().clamp(0, chapters.length - 1)],
                    factorChange: _auxPercent!.toDouble(),
                  ),
                ),
                // FRONT CARD
                Transform.translate(
                  offset: Offset(
                      -800 * _percent!.toDouble(), 100 * _percent!.toDouble()),
                  child: Transform.rotate(
                    angle: (3.14 * -0.5) * _percent!.toDouble(),
                    // CHANGE ROTATION HERE
                    child: ChapterCard(
                      chapter: chapters[_index!.toInt()],
                      factorChange: _percent!.toDouble(),
                    ),
                  ),
                )
              ]),
            ),
            PageView.builder(
                controller: _pageController,
                itemCount: chapters.length,
                itemBuilder: (context, index) {
                  return  InkWell(onTap: () => _openDetail(context, chapters[index]));

                })
          ],
        ),
      ),
    );
  }
}
_openDetail(BuildContext context, Chapter chapter) {
  Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation){
    return FadeTransition(opacity: animation, child: ChapterDetailsPage(chapter: chapter,),);
  }));
}

