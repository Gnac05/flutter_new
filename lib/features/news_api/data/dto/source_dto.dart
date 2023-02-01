import 'package:flutter_news/features/news_api/domain/entities/source.dart';

class SourceDTO extends Source{
  SourceDTO({super.name});

  static SourceDTO fromJson(Map<String, dynamic> json)=> SourceDTO(name: json['name']);
}