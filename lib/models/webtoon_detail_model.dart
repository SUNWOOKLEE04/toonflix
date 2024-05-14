class WebtoonDetailModel {
  final String title, age, genre, about;

  WebtoonDetailModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        age = json['age'],
        genre = json['genre'],
        about = json['about'];
}
