class Jokes {
  final List<JokeTile> tiles;

  Jokes({required this.tiles});
}

class JokeTile {
  String title;
  String description;

  JokeTile({required this.title, required this.description});
}
