import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

Widget resourceCard({String? image, String? title, String? link}) {
  Uri url = Uri.parse(
      link!);
  Future<void> launchLink() async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
  return GestureDetector(
    onTap: launchLink,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(30),
          child: Row(
        children: [
          Container(
            height: 200,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(image!))),
          ),
          const SizedBox(width: 10,),
          SizedBox(
              width: 200,
              child: Text(title!, style: GoogleFonts.inconsolata(fontSize: 20,), textAlign: TextAlign.center,))
        ],
      )),
    ),
  );
}
