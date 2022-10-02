
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hadean_crew/Modules/resources.dart';
import 'package:hadean_crew/Widgets/resources_card.dart';

class ResourcesPage extends StatefulWidget {
  const ResourcesPage({Key? key}) : super(key: key);

  @override
  State<ResourcesPage> createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
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
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: ListView(
                children: [
                  const SizedBox(height: 15,),
                  for(var website in websites) ...[
                    resourceCard(image: website.image, title: website.title, link: website.link)
                  ],
                  const Divider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
