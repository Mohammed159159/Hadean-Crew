import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hadean_crew/Screens/ScriptPage/chapters_slider_page.dart';
import 'package:hadean_crew/Screens/animation_page.dart';
import 'package:hadean_crew/Screens/resources_page.dart';

Widget menuContainer({
  String? image,
  String? title,
  double? height,
  double? width,
  BuildContext? context,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: height!,
      width: width!,
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.white.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(20), //remove for optimization?
          image: DecorationImage(
              image: AssetImage(
                image!,
              ),
              fit: width > height ? BoxFit.fitWidth : BoxFit.fitHeight)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.deepOrange,
            onTap: () {
              Navigator.of(context!).push(_createRoute(title));
            },
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title!,
                  style: GoogleFonts.notoSansMono(
                      color: Colors.white, fontSize: 21),
                )),
          ),
        ),
      ),
    ),
  );
}

Route _createRoute(String title) {
  Map<String, Widget> pages = {
    "Animation": const AnimationPage(),
    "Script": const AnimationSliderPage(),
    "Resources" : const ResourcesPage(),
  };
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 1000),
    pageBuilder: (context, animation, secondaryAnimation) {
      return pages[title]!;
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
