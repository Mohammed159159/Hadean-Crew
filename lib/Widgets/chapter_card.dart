import 'dart:ui';

import 'package:hadean_crew/Modules/chapters.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChapterCard extends StatelessWidget {
  final Chapter chapter;
  final double factorChange;

  const ChapterCard({
    Key? key,
    required this.chapter,
    required this.factorChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return OverflowBox(
      maxHeight: size.height,
      alignment: Alignment.topCenter,
      child: Stack(
        children: [
          // COLOR BACKGROUND WITH ROUNDED CORNERS
          Positioned.fill(
              top: size.height * 0.24,
              child: Hero(
                tag: chapter.number.toString(),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Color(chapter.color!),
                      borderRadius: BorderRadius.circular(30)),
                ),
              )),
          // CHAPTER IMAGE
          Positioned(
            left: 40,
            right: 40,
            top: size.height * 0.24 * factorChange + size.height * 0.06,
            child: Opacity(
                opacity: 1 - factorChange,
                child: Transform.scale(
                  scale: lerpDouble(1, 0.4, factorChange),
                  child: Hero(
                    tag: chapter.title.toString(),
                    child: Image.asset(chapter.image.toString(), height: size.height * 0.4,
                    ),
                  ),
                )
            ),
          ),
          Positioned(
            left: 40,
            right: 10,
            top: size.height * 0.50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Hero(
                    tag: chapter.image.toString(),
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        chapter.title!.replaceAll(" ", "\n").toLowerCase(),
                        style: GoogleFonts.inconsolata(fontSize: 40, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                /*
                DESCRIPTION
                Hero(

                  tag: chapter.color.toString(),
                  child: Text(
                    chapter.title!.toLowerCase(),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),*/
                const SizedBox(height: 25),
                Text.rich(
                  const TextSpan(text: "learn more", children: [
                    WidgetSpan(
                        child: Icon(Icons.arrow_right_alt,
                            color: Colors.deepOrange),
                        alignment: PlaceholderAlignment.middle)
                  ]),
                  style: GoogleFonts.inconsolata( //spartan
                    color: Colors.deepOrange,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
