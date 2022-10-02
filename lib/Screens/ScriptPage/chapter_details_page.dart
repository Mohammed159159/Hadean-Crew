import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hadean_crew/Modules/chapters.dart';

class ChapterDetailsPage extends StatefulWidget {
  final Chapter chapter;

  const ChapterDetailsPage({
    Key? key,
    required this.chapter,
  }) : super(key: key);

  @override
  State<ChapterDetailsPage> createState() => _ChapterDetailsPageState();
}

class _ChapterDetailsPageState extends State<ChapterDetailsPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _colorGradientValue;
  Animation<double>? _whiteGradientValue;
  bool? _changeToBlack;
  bool? _enableInfoItems;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _colorGradientValue = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        curve: const Interval(0.0, 1.0, curve: Curves.fastOutSlowIn),
        parent: _controller!));

    _whiteGradientValue = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        curve: const Interval(0.1, 1.0, curve: Curves.fastOutSlowIn),
        parent: _controller!));

    _changeToBlack = false;
    _enableInfoItems = false;
    Future.delayed(const Duration(milliseconds: 600), () {
      _controller!.forward();
      Future.delayed(const Duration(milliseconds: 300), () {
        setState(() {
          _changeToBlack = true;
        });
      });
    });
    _controller!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _enableInfoItems = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    var textTheme = Theme
        .of(context)
        .textTheme;
    return Material(
      child: Stack(
        children: [
          //Body
          Positioned.fill(
              child: Hero(
                tag: widget.chapter.number.toString(),
                child: AnimatedBuilder(
                    animation: _controller!,
                    builder: (_, __) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Color(widget.chapter.color!.toInt()),
                                  Colors.white
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [
                                  _colorGradientValue!.value,
                                  _whiteGradientValue!.value
                                ])),
                      );
                    }),
              )),

          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.1,),
                  Hero(
                    tag: widget.chapter.title.toString()
                    //change when images are available,
                    ,
                    child: Image.asset(
                      widget.chapter.image.toString(),
                      height: size.height * 0.3,
                      width: size.width,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10,),
                                  FittedBox(
                                    // Align(alignment: Alignment.bottomLeft, heightFactor: 0.7)
                                    child: Hero(
                                      tag: widget.chapter.image.toString(),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: AnimatedDefaultTextStyle(
                                          duration: kThemeAnimationDuration,
                                          style: GoogleFonts.inconsolata().copyWith(
                                            color: _changeToBlack!
                                                ? Colors.black
                                                : Colors.white,
                                          ),
                                          child: Text(
                                            widget.chapter.title!
                                                .replaceAll(" ", "\n")
                                                .toLowerCase(),
                                            style: GoogleFonts.inconsolata(
                                                fontSize: 50),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  /*
                                  DESCRIPTION
                                  SizedBox(
                                    width: size.width * 0.55,
                                    child: Hero(
                                      tag: widget.chapter.title.toString() + widget.chapter.color.toString(),
                                      child: AnimatedDefaultTextStyle(
                                        duration: kThemeAnimationDuration,
                                        style: textTheme.headline5!.copyWith(
                                          color: _changeToBlack!
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                        child: Text(
                                          widget.chapter.title!.toLowerCase(),
                                        ),
                                      ),
                                    ),
                                  ),*/
                                ],
                              ),
                              SizedBox(
                                child: Column(
                                  children: [
                                    TweenAnimationBuilder<double>(
                                      curve: Curves.fastOutSlowIn,
                                      duration: const Duration(
                                          milliseconds: 400),
                                      tween: Tween(
                                          begin: 0.0,
                                          end: _enableInfoItems! ? 1.0 : 0.0),
                                      child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              widget.chapter.isLiked =
                                              !widget.chapter.isLiked!;
                                            });
                                          },
                                          icon: widget.chapter.isLiked!
                                              ? const Icon(
                                            Icons.favorite_sharp,
                                            size: 45,
                                            color: Colors.red,
                                          )
                                              : const Icon(
                                            Icons.favorite_border_sharp,
                                            size: 40,)),
                                      builder: (context, value, child) {
                                        return Transform.scale(
                                            scale: value, child: child);
                                      },
                                    ),
                                    const SizedBox(height: 10,),
                                    TweenAnimationBuilder<double>(
                                      curve: Curves.fastOutSlowIn,
                                      duration: const Duration(
                                          milliseconds: 400),
                                      tween: Tween(
                                          begin: 0.0,
                                          end: _enableInfoItems! ? 1.0 : 0.0),
                                      child: Image.asset(
                                        "assets/images/rocket.png",
                                        //check the real code
                                        width: 50,
                                      ),
                                      builder: (context, value, child) {
                                        return Transform.scale(
                                            scale: value, child: child);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        AnimatedOpacity(
                          opacity: _enableInfoItems! ? 1.0 : 0,
                          duration: kThemeAnimationDuration,
                          child: const Divider(
                            height: 30,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        widget.chapter.paragraphs!.isNotEmpty
                            ? AnimatedContainer(
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.elasticOut,
                          transform: Matrix4.translationValues(
                              0, _enableInfoItems! ? 0 : 50, 0),
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 200),
                            opacity: _enableInfoItems! ? 1.0 : 0.0,
                            child: Text(
                                "Story",
                                style: GoogleFonts.inconsolata(fontSize: 40)
                            ),
                          ),
                        )
                            : const SizedBox.shrink(),
                        const SizedBox(
                          height: 10,
                        ),
                        widget.chapter.paragraphs!.isNotEmpty ? SizedBox(
                          width: size.width * 0.85,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.elasticOut,
                            transform: Matrix4.translationValues(
                                0, _enableInfoItems! ? 0 : 50, 0),
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 200),
                              opacity: _enableInfoItems! ? 1.0 : 0.0,
                              child: Column(
                                children: [
                                  for (int i = 0; i < widget.chapter.paragraphs!
                                      .length; i++) ...[
                                    i % 2 == 0 ?
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: size.width * 0.65,
                                          child: Text(
                                            widget.chapter.paragraphs![i].text
                                                .toString(),
                                            style: GoogleFonts.inconsolata()
                                                .copyWith(color: Colors.black),
                                          ),
                                        ),
                                        Image.asset(
                                            (widget.chapter.paragraphs![i].icon
                                                .toString()), width: 30,)
                                      ],
                                    ) :
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                            (widget.chapter.paragraphs![i].icon
                                                .toString()), width: 30,),
                                        SizedBox(
                                          width: size.width * 0.65,
                                          child: Text(
                                            widget.chapter.paragraphs![i].text
                                                .toString(),
                                            style: GoogleFonts.inconsolata()
                                                .copyWith(color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),

                                  ]
                                ],
                              ),
                            ),
                          ),
                        ) : const SizedBox.shrink(),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Back Button
          Positioned(
            left: 20,
            top: 0,
            child: SafeArea(
              child: IconButton(
                  onPressed: () async {
                    setState(() {
                      _enableInfoItems = false;
                    });
                    Future.delayed(const Duration(milliseconds: 600), () {
                      setState(() {
                        _changeToBlack = false;
                      });
                    });
                    await _controller!.reverse();
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
          )
        ],
      ),
    );
  }
}
