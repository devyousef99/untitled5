class Album {
  final userId;
  final id;
  final title;

  Album({ this.id,  this.title,  this.userId});

  factory Album.fromjson(Map<String, dynamic> parsedjson) {
    return Album(
        id: parsedjson["id"],
        title: parsedjson["title"],
        userId: parsedjson["userId"]);
  }
}
