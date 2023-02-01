import 'package:flutter_news/features/news_api/domain/repositories/new_repository.dart';

import '../entities/new.dart';

class GetNewTopHeadlines {
  final NewRepository newRepository;
  GetNewTopHeadlines(this.newRepository);

  Future<New> execute(
    String? q,
    String? country,
    String? category,
  ) async {
    return await newRepository.getNewTopHeadlines(q, country, category);
  }
}
