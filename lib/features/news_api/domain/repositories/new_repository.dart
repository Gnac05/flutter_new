// import 'package:dartz/dartz.dart';
// import 'package:flutter_news/core/error/failure.dart';
import 'package:flutter_news/features/news_api/domain/entities/new.dart';

abstract class NewRepository {
  // Future<Either<Failure, New>> getConcreteNewEverything(String q, String language, String from);
  // Future<Either<Failure, New>> getConcreteNewTopHeadlines(String q, String country, String category);
  Future<New> getNewEverything(String q, String? language, String? from);
  Future<New> getNewTopHeadlines(String? q, String? country, String? category);
}