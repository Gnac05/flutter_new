import 'package:flutter_news/features/news_api/data/dto/source_dto.dart';
import 'package:flutter_news/features/news_api/domain/entities/article.dart';

class ArticleDTO extends Article {
  // SourceDTO sourceDTO;
  String publishedAt;

  ArticleDTO(
      {required super.url,
      required this.publishedAt,
      required super.source,
      required super.author,
      required super.content,
      required super.description,
      required super.title,
      required super.urlToImage});

  static ArticleDTO fromJson(Map<String, dynamic> json) {
    final article = Article.fromMap(json);
    return ArticleDTO(
        url: article.url,
        publishedAt: json['publishedAt'],
        source: SourceDTO.fromJson(json['source']),
        author: article.author,
        content: article.content,
        description: article.description,
        title: article.content,
        urlToImage: article.urlToImage);
  }
}
