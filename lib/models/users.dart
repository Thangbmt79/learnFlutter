class Users {
  int id;
  String slug;
  String url;
  String title;
  String content;
  String image;
  String thumbnail;

  String publishedAt;
  String updatedAt;
  int userId;

  Users({
    required this.id,
    required this.slug,
    required this.url,
    required this.title,
    required this.content,
    required this.image,
    required this.thumbnail,
    required this.publishedAt,
    required this.updatedAt,
    required this.userId,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'],
      slug: json['slug'],
      url: json['url'],
      title: json['title'],
      content: json['content'],
      image: json['image'],
      thumbnail: json['thumbnail'],
      publishedAt: json['publishedAt'],
      updatedAt: json['updatedAt'],
      userId: json['userId'],
    );
  }
}
