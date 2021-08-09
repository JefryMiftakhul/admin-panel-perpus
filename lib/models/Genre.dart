class Genre {
  final String id;
  final String name;

  Genre({this.id, this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['genre_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() => {
    //'id': id,
    'name': name,
  };
}