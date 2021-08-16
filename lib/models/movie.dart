class Movie {
  int? id;
  String? name;
  String? director;
  String? poster;

  Movie(this.id, this.name, this.director, this.poster);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'name': name,
      'director': director,
      'poster': poster
    };
    return map;
  }

  Movie.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    director = map['director'];
    poster = map['poster'];
  }
}
