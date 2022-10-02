class Resource {
  String? image;
  String? title;
  String? link;

  Resource({this.image, this.title, this.link});
}

List<Resource> websites = [
  Resource(
      image: "assets/images/challenge.jpg",
      title: "Nasa Space Apps Challenge Resources",
      link:
          "https://2022.spaceappschallenge.org/challenges/2022-challenges/on-the-way-to-the-sun/resources"),
  Resource(
      image: "assets/images/wiki.jpeg",
      title: "Spaceflight before 1951",
      link:
      "https://en.wikipedia.org/wiki/Spaceflight_before_1951"),
  Resource(
      image: "assets/images/nasa.png",
      title: "Parker Solar Probe",
      link:
      "https://www.nasa.gov/content/goddard/parker-solar-probe"),
  Resource(
      image: "assets/images/spaceline.jpeg",
      title: "Rocket Missile Program",
      link:
      "https://www.spaceline.org/cape-canaveral-rocket-missile-program/bumper-wac"),
  Resource(
      image: "assets/images/ted.jpeg",
      title: "TED ED",
      link:
      "https://ed.ted.com/"),
];

List<Resource> videos = [];
