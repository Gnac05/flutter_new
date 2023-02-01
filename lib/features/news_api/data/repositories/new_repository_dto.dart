import 'package:flutter_news/features/news_api/data/datasources/new_api_remote_datasource.dart';
import 'package:flutter_news/features/news_api/domain/entities/new.dart';
import 'package:flutter_news/features/news_api/domain/repositories/new_repository.dart';

class NewRepositoryDTO implements NewRepository {
  final NewAPIRemote _newAPIRemote = NewAPIRemote();
  @override
  Future<New> getNewEverything(
      String q, String? language, String? from) async {
    final newDTO = await _newAPIRemote.getEverything(q, language, from);
    if (newDTO != null) {
      return New(
          message: newDTO.message,
          totalResults: newDTO.totalResults,
          articles: newDTO.articles);
    }
    throw UnimplementedError();
  }

  @override
  Future<New> getNewTopHeadlines(
      String? q, String? country, String? category) async {
    final newDTO = await _newAPIRemote.getTopHeadlines(q, country, category);
    if (newDTO != null) {
      return New(
          message: newDTO.message,
          totalResults: newDTO.totalResults,
          articles: newDTO.articles);
    }
    throw UnimplementedError();
  }
}
