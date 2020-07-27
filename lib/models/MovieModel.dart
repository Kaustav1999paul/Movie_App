class ArticleModel {
  int page;
  String poster_path;
  int id;
  String backdrop_path;
  String title;
  String overview;
  String release_date;

  ArticleModel({
    this.backdrop_path,
    this.id,
    this.page,
    this.overview,
    this.poster_path,
    this.release_date,
    this.title,
  });
}
