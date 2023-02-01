import 'package:flutter_news/core/model/app_model.dart';
import 'package:flutter_news/features/news_api/data/repositories/new_repository_dto.dart';
import 'package:flutter_news/features/news_api/domain/repositories/new_repository.dart';
import 'package:flutter_news/features/news_api/domain/uses_cases/get_new_top_headlines.dart';
import 'package:flutter_news/features/news_api/presentation/blocs/blocEverything/everything_bloc.dart';
import 'package:flutter_news/features/news_api/presentation/blocs/blocTopHeadlines/top_headlines_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../features/news_api/domain/uses_cases/get_new_everything.dart';

GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<AppModel>(AppModel());

// Blocs
  getIt.registerFactory(() => EverythingBloc(getIt()));
  getIt.registerFactory(() => TopHeadlinesBloc(getIt()));

//Uses Cases
  getIt.registerLazySingleton(() => GetNewEverything(getIt()));
  getIt.registerLazySingleton(() => GetNewTopHeadlines(getIt()));

// Repository
  getIt.registerLazySingleton<NewRepository>(() => NewRepositoryDTO());
  // getIt.registerSingleton<GetNewEverything>(GetNewEverything(getIt()));

  // getIt.registerSingleton<NewRepository>(NewRepository);


  //Uses Cases

  //Repository
  // getIt.registerLazySingleton<NewRepository>(() => NewRepositoryDTO());

}
