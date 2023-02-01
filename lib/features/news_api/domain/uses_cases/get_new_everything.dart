import 'package:flutter_news/features/news_api/domain/repositories/new_repository.dart';

import '../entities/new.dart';

class GetNewEverything {
  final NewRepository newRepository;
  GetNewEverything(this.newRepository);

  Future<New> execute(
    String q,
    String? language,
    String? from,
  ) async {
    return await newRepository.getNewEverything(q, language, from);
  }
}
