import 'package:flutter_news/features/news_api/data/dto/article_dto.dart';
import 'package:flutter_news/features/news_api/domain/entities/article.dart';

import '../../domain/entities/new.dart';

/// Cette classe
class NewDTO extends New {
  String status;
  List<ArticleDTO>? articlesDTO;
  NewDTO(
      {required this.status,
      super.articles,
      super.message,
      this.articlesDTO,
      super.totalResults});

  static NewDTO fromJson(Map<String, dynamic> json) {
    if (json['status'] == 'ok') {
      List<dynamic> listMap = json['articles'];
      // List<ArticleDTO> articlesDTO = [];
      List<Article> articles = [];
      for (var map in listMap) {
        // articlesDTO.add(ArticleDTO.fromJson(map));
        articles.add(Article.fromMap(map));
      }
      return NewDTO(
        articles: articles,
          status: json['status'],
          // articlesDTO: articlesDTO,
          totalResults: json['totalResults']);
    } else {
      return NewDTO(status: json['status'], message: json['message']);
    }
  }
}
