import 'dart:ui';

import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hadean_crew/Widgets/menu_container.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.0005, 0.8, 1],
                  colors: [Colors.black, Color(0xff0A2B3E), Colors.black])),
          child: AnimatedBackground(
            behaviour: RandomParticleBehaviour(
                options: const ParticleOptions(
                    spawnMaxRadius: 10,
                    spawnMinSpeed: 10.00,
                    spawnMaxSpeed: 50,
                    particleCount: 100,
                    minOpacity: 0.3,
                    spawnOpacity: 0.4,
                    baseColor: Colors.white,
                    image: Image(image: AssetImage("assets/images/star.png")))),
            vsync: this,
            child: Column(
              children: [
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.menu,
                            color: Colors.white.withOpacity(0.8),
                          )),
                      Text("Hadean",
                          style: GoogleFonts.inconsolata(
                              color: Colors.white, fontSize: 60)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Discover...",
                        style: GoogleFonts.inconsolata(
                            color: Colors.deepOrange, fontSize: 25)),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    menuContainer(
                        image: "assets/images/animation.jpg",
                        title: "Animation",
                        height: height * 0.4,
                        width: width * 0.46,
                        context: context),
                    menuContainer(
                        image: "assets/images/script.jpg",
                        title: "Script",
                        height: height * 0.4,
                        width: width * 0.45,
                        context: context)
                  ],
                ),
                const SizedBox(height: 10),
                menuContainer(
                    image: "assets/images/resources.jpg",
                    title: "Resources",
                    height: height * 0.15,
                    width: width * 0.9,
                    context: context),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/images/nasa.png",
                  scale: 3,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
