import 'package:flutter/material.dart';

class Chapter {
  int? number;
  String? title;
  String? image;

  //description?
  List<Paragraph>? paragraphs;
  int? color;
  bool? isLiked = false;

  //song? - background animation image?
  Chapter(
      {this.number,
      this.title,
      this.image,
      this.paragraphs,
      this.color,
      this.isLiked});
}

class Paragraph {
  String? text;
  String? icon;

  Paragraph({this.text, this.icon});
}

List<Chapter> chapters = [
  Chapter(
      number: 1,
        title: "Foolish spices and stars",
      image: "assets/images/staricon.png",
      paragraphs: <Paragraph>
      [
        Paragraph(
            text: "Daedalus -A famous craftsman known for his renowned invention, the Labyrinth, to trap the creature named the Minotaur- fashioned two pairs of wings out of wax and feathers for himself and his son Icarus. Upon trying them, Icarus, overcome by greed and lust for power, soared into the sky, trying to quench his thirst. But he came too close to the sun. And without warning, the heat -from the sunmelted the wax holding his feathers together. One by one, as the feathers slowly melted, Icarus slowly fell into the sea, never to be seen again. Similar stories occurred throughout the ages and even took form in the bible when humans tried to build the “Gate of God,” otherwise more famously known as the “Tower of babel,” although many interpretations differ in this story, for the sake of the story writing; we will not debate them, but shall take the possibility that this tower was built as to reach the gods or ascend to become them, but was struck down by the wrath of the god(s).",
            icon: "assets/images/rocket.png"),
        Paragraph(
          text: "These stories make an epigraph which was long set in history, maybe even before humans ever set foot on earth, as to exhort any foolish attempt of reaching the realm of the gods; The skies, undoubtedly for humans to ascend onto space and learn about it is more foolish than for fish to live on land. These stories held absolute truth until the 20th century; on a regular Thursday for most, The human species, on May 13, 1948, defied these old fables and set foot into a future that holds the unknown; by launching the first ever manmade object to enter the space, The \“Bumper-WAC.\"",
          icon: "assets/images/writing.png"
        )
      ],
    color: 0xff7f7872,
    isLiked: false,
  ),
  Chapter(
      number: 2,
      title: "Failures, adaptions, and evolutions",
      image: "assets/images/book-stack.png",
      paragraphs: <Paragraph>
      [
        Paragraph(
            text:
            """Bumper-WAC's initial launch was on May 13, 1948, it was deemed a failure at that time, but in the eyes of history, it was only the start of what's soon going to be the first man-made object to reach space.""",
            icon: "assets/images/rocket.png"),
        Paragraph(
            text:
            """Failures upon failures upon failures began stacking up; as the scientists began learning from their  mistakes, avoiding errors, and adapting to new problems that arose, that was the general strategy that the scientists used going all the way from the initial launch until the launch number #4, That's until trial #5.""",
            icon: "assets/images/rocket.png"),
        Paragraph(
            text: "On February 24, 1949, none of the scientists knew then that with this trial, their names would be written as the pioneers of the early space shuttles, making Bumber#5 the first manmade object to go beyond the threshold of the skies and reach space.",
            icon: "assets/images/rocket.png"
        ),
        Paragraph(
            text: "Several trials were held after that, some with their successes and some with their failures ending with trial number 8, marking the end of the famous project Bumper-WAC.",
            icon: "assets/images/rocket.png"
        )
      ],
    color: 0xff49544a,
    isLiked: false
  ),
  Chapter(
      number: 3,
      title: "The space race",
      image: "assets/images/star.png",
      paragraphs: <Paragraph>
      [
        Paragraph(
            text: "On August 2, 1955, one of the most ambitious projects started, A project which’s mission was to cease the moon; coincidentally, the space race also started. Whether the Communist party or the American party won is somewhat debatable, as the communist party was able to achieve a lot of tactical wins; still, in the grand scheme of things, the Americans were able to reach the moon first, but let’s not enter a debate which remains unsolved until this day and put it aside for now.At 2:56 on July 21, 1969, the first man ever set his foot on the moon, a feat which, if described 150 years ago, would only be an act of insanity or the imagination of a second-tier sci-fi writer, nevertheless the humans were able to achieve the first step in the bottomless dark pit we call the space.",
            icon: "assets/images/rocket.png"),
        Paragraph(
            text: "This mission was called Apollo for the sole reason that the NASA manager thought about the gods of a past time and thought for himself that the thought of Apollo riding his chariot across the Sun was appropriate for such a grandiose mission. This mission was called Apollo for the sole reason that the NASA manager thought about the gods of a past time and thought for himself that the thought of Apollo riding his chariot across the Sun was appropriate for such a grandiose mission. This mission was called Apollo for the sole reason that the NASA manager thought about the gods of a past time and thought for himself that the thought of Apollo riding his chariot across the Sun was appropriate for such a grandiose mission. Although this mission is sure to be a tiny achievement, not worth a pebble in the grand scheme of things in the far distant future, for now, we ascent upon the realm of gods, into the unknown, leaving our mark as a species in the universe, which for is indeed enough for one to experience in his own lifetime, that’s what at least one of the scientists must have thought back then. Although the space race continued almost six years after the first moon landing, it quickly ended on July 17, 1975, in which case most historians account for the win to be for the west.",
            icon: "assets/images/wrong.jpeg"),
      ],
    color: 0xff87565e,
    isLiked: false
  ),
  Chapter(
      number: 4,
      title: "A Scientific Revolution",
      image: "assets/images/science.png",
      paragraphs: <Paragraph>
      [
        Paragraph(
          text: "On April 28, 2021, a Probe by the name Parker Solar Probe was able to touch the sun, which, if told to the Egyptian civilization back 8000 years ago, would be an act of blasphemy toward their god RA (the sun), which undoubtedly would have resulted in a sentence to death at best back then. Some may think that the almost unreal scientific achievement, announced on April 28, 2021, was nothing more than a conspiracy theory made by the American government, so for the listeners who may have doubts, let us explain the concept easily without getting into any details.",
            icon: "assets/images/rocket.png"),
        Paragraph(
          text: "Let us imagine you have a boiling pot of water at 100 Celsius. For our American listeners, it is 212 Fahrenheit, and an oven of twice the temperature in Celsius and the temperature which would equal it in Fahrenheit, and you put your hand in both (don’t try at home). Although you probably won’t last long in either, you would probably last longer in the oven and with fewer burns. One might wonder that this concept may work on a small scale, but not on a large, but It works perfectly well here; touching the sun means touching its outermost atmosphere, the corona, meaning that if it were for an object to built to move fast and in a way to disperse most of the heat waves, the hundreds of thousands of degrees would only feel like a mere couple of thousands of degrees or less, and that’s the sole principle of the scientific breakthrough technology which we call it nowadays by the name \“Parker Solar Probe.\”",
            icon: "assets/images/wrong.jpeg"),
      ],
      color: 0xff3c3f41,
      isLiked: false
  ),
  Chapter(
      number: 5,
      title: "What now?",
      image: "assets/images/virtual-reality.png",
      paragraphs: <Paragraph>
      [
        Paragraph(
          text: "The Parker Solar Probe wasn’t the achievement of our age but rather the achievement of those scientists of a past generation who worked hard, and we were able to harvest their hard work and put it into action; the same goes for what we believe in right now and work toward, being colonizing Mars. A fun proposed idea for making mars prohibited is nuking both the poles of mars, thus melting the ice, and kicking up some extra co2 in the atmosphere, hopefully creating somewhat of an atmosphere. Whether that dream is going to be realized now or later is a mixture of hard work and luck, but surely one day, we will reach mars and planets further beyond, and only then will the science fiction space operas of our age come true.",
            icon: "assets/images/rocket.png"),
        Paragraph(
          text: "Many may wonder when such time will come, but it shouldn’t be more than 200 years into the future; that’s due to an effect called the scientific singularity, which is a phenomenon that suggests at a given hypothetical point in time at which technological growth will become radically faster and uncontrollable, resulting in unforeseeable changes to human civilization. Putting it simply, it suggests that there is a noticeable exponential rate and a shorter time between each significant scientific discovery; the best case and example of this is the evolution of phones throughout the years. Myths, stories, thoughts and imagination, ambition, trials, improvement, and succession, perhaps that’s what makes our species very special in this vast black beautiful space, and that’s why we always look toward the future, holding onto our present, and never losing sight of the past.",
            icon: "assets/images/wrong.jpeg"),
      ],
      color: 0xfff6ba30,
      isLiked: false
  ),
];
