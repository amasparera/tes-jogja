class NewsModel {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlImage;
  final String publishedAt;
  final String content;

  final String? id;
  final String? names;

  NewsModel(
      {required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlImage,
      required this.publishedAt,
      required this.content,
      this.id,
      this.names});

  factory NewsModel.fromJson(Map<String, dynamic> map) {
    return NewsModel(
        author: map["author"] ?? " ",
        title: map["title"] ?? "",
        description: map["description"] ?? "",
        url: map["url"] ?? "",
        urlImage: map["urlToImage"] ??
            "https://bsmedia.business-standard.com/_media/bs/img/article/2022-07/09/full/1657331493-2949.jpg",
        publishedAt: map["publishedAt"] ?? "2022-07-11T03:31:00Z",
        content: map["content"] ?? "");
  }
}
