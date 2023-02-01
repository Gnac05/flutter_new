import 'package:flutter_news/features/news_api/domain/entities/source.dart';

import '../../data/dto/source_dto.dart';

class Article {
  Source? source;
  String? url;
  String? author;
  String? title;
  String? description;
  String? urlToImage;
  String? content;

  Article({this.url, required this.source, required this.author, required this.content, required this.description, required this.title, required this.urlToImage});

  static Article fromMap(Map<String, dynamic> json) =>Article(url: json['url'], source: SourceDTO.fromJson(json['source']), author: json['author'], content: json['content'], description: json['description'], title: json['title'], urlToImage: json['urlToImage']);
}