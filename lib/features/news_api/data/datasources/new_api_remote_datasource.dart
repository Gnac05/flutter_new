import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/core/config/constant.dart';
import 'package:flutter_news/features/news_api/data/dto/new_dto.dart';

/// Cette classe permet de prendre les données
/// de l'API pour les envoiées dans l'application
class NewAPIRemote {
  /// getEverything permet de communiquer avec NewsApi pour connaître les actualités en fonction des paramètres
  /// qu'il ressoit de l'utilisateur.
  /// 
  /// Cette fonction ne doit pas être appelé s'il n'a pas la connection
  /// pour éviter toutes complications.
  Future<NewDTO?> getEverything(String q, String? language, String? from) async {
    print('####### ---- $q');
    final dio = Dio();
    final uri = Uri(
        scheme: 'https',
        host: baseUrl,
        path: '$version/$everything',
        queryParameters: {
          'q': q.trim(),
          'sortBy': 'popularity',
          'language': language?? '',
          'from': from?? '',
          'to': DateTime.now().toString().substring(0, 10),
          'apiKey': apiKey
        }); 
    print("######### --- API ${uri.toString()}");
    final response = await dio.getUri(uri);
    print("######### --- API Get");
    try {
      if (response.statusCode == 200) {
        // print(response.data);
        return NewDTO.fromJson(response.data);
      }
    } catch (e) {
      return NewDTO(
          status: 'error',
          message: "Quelque chose s'est mal passé. Error : ${e.toString()}");
    }
    return null;
  }

  /// getTopHeadlines permet de communiquer avec NewsApi pour connaître les gros titles.
  /// 
  /// Cette fonction ne doit pas être appelé s'il n'a pas la connection
  /// pour éviter toutes complications.
  Future<NewDTO?> getTopHeadlines(String? q, String? country, String? category) async {
    final dio = Dio();
    final uri = Uri(
        scheme: 'https',
        host: baseUrl,
        path: '$version/$topHeadlines',
        queryParameters: {
          'q': q??'',
          'country': country??'',
          'category': category??'',
          'apiKey': apiKey
        });
    final response = await dio.getUri(uri);
    try {
      if (response.statusCode == 200) {
        return NewDTO.fromJson(response.data);
      }
    } catch (e) {
      return NewDTO(
          status: 'error',
          message: "Quelque chose s'est mal passé. Error : ${e.toString()}");
    }
    return null;
  }
}
