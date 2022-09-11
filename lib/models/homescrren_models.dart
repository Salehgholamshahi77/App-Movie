class HomeModels {
  int? id;
  String? title;
  String? poster;
  String? years;
  String? country;
  String? imdb;
  List? genres;
  List? images;

  HomeModels(
      {required this.id,
      required this.title,
      required this.poster,
      required this.years,
      required this.country,
      required this.imdb,
       this.genres,
       this.images});

  HomeModels.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    poster = element["poster"];
    years = element["year"];
    country = element["country"];
    imdb = element["imdb_rating"];
    genres = element["genres"];
    images = element["images"];
  }
}
