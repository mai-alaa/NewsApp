import 'dart:convert';

class Articles {
  Articles({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  String status;
  int totalResults;
  List<Article> articles;

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
      status: json["status"],
      totalResults: json["totalResults"],
      articles: (json["articles"] as List<dynamic>)
          .map((articleJson) =>
              Article.fromJson(articleJson as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": articles.map((article) => article.toJson()).toList(),
      };
}

class Article {
  Article({
    required this.source,
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  Source source;
  String? author;
  String title;
  String? description;
  String url;
  String? urlToImage;
  DateTime publishedAt;
  String? content;

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json["source"] as Map<String, dynamic>),
      author: json["author"] as String?,
      title: json["title"],
      description: json["description"] as String?,
      url: json["url"],
      urlToImage: json["urlToImage"] as String?,
      publishedAt: DateTime.parse(json["publishedAt"] as String),
      content: json["content"] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
      };
}

class Source {
  Source({
    this.id,
    required this.name,
  });

  String? id;
  String name;

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json["id"] as String?,
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
