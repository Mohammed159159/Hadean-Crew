import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  late YoutubePlayerController controller;
  int i = 0;
  var urls = [
    "https://youtu.be/Rxt9MRZOdpY",
    "https://youtu.be/K8oVw9xRUqo"
    "https://youtu.be/SBTMBla0wPg",
    "https://youtu.be/mvh_cFw9Uzc"
    "https://youtu.be/6eBNEcQp_es",

  ];
  @override
  void initState() {

    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(urls[i % urls.length])!)..addListener(() {if(mounted){
      setState(() {
      });}
    });
    super.initState();
  }

  @override
  void deactivate() {
    controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: controller,
        progressColors: const ProgressBarColors(
            playedColor: Colors.deepOrange,
            handleColor: Colors.amber
        ),
      ),
      builder: (context, player) =>
          Scaffold(
              body: Column(
                children: [
                  FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.9,
                          width: MediaQuery.of(context).size.width,
                          child: player)),
                  const SizedBox(height: 10,),
                  Text("Chapter ${urls.indexOf(urls[i]) + 1}", style: GoogleFonts.inconsolata(fontSize: 20),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: (){
                        i--;
                        i %= urls.length;
                        controller.load(YoutubePlayer.convertUrlToId(urls[i])!);
                      }, icon: const Icon(Icons.navigate_before_rounded),
                        iconSize: 30,),
                      IconButton(onPressed: (){
                        i++;
                        i %= urls.length;
                        controller.load(YoutubePlayer.convertUrlToId(urls[i])!);
                      }, icon: const Icon(Icons.navigate_next_rounded), iconSize: 30,),
                    ],
                  )
                ],
              )
          ),
    );
  }
}