import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/config/di.dart';
import '../../../../../core/model/app_model.dart';

part 'sort_top_headlines_event.dart';
part 'sort_top_headlines_state.dart';

class SortTopHeadlinesQBloc
    extends Bloc<SortTopHeadlinesEvent, SortTopHeadlinesState> {
  SortTopHeadlinesQBloc() : super(SortTopHeadlinesInitialQ()) {
    on<TopHeadlinesQ>(onTopHeadlinesQ);
  }
  Future<void> onTopHeadlinesQ(event, emit) async {
    emit(SortTopHeadlinesReadyQ(
        controller: getIt<AppModel>().text2Contoller(event.text)));
    await getIt<AppModel>().setTopHeadlinesQ(event.text);
  }
}

class SortTopHeadlinesCountryBloc
    extends Bloc<SortTopHeadlinesEvent, SortTopHeadlinesState> {
  SortTopHeadlinesCountryBloc() : super(SortTopHeadlinesInitialCountry()) {
    on<TopHeadlinesCountry>(onTopHeadlinesCountry);
  }
  Future<void> onTopHeadlinesCountry(event, emit) async {
    emit(SortTopHeadlinesReadyCountry(countryIndex: event.countryIndex));
    await getIt<AppModel>().setCountry(event.countryIndex);
  }
}


class SortTopHeadlinesCategoryBloc
    extends Bloc<SortTopHeadlinesEvent, SortTopHeadlinesState> {
  SortTopHeadlinesCategoryBloc() : super(SortTopHeadlinesInitialCategory()) {
    on<TopHeadlinesCategory>(onTopHeadlinesCategory);
  }
  Future<void> onTopHeadlinesCategory(event, emit) async {
    emit(SortTopHeadlinesReadyCategory(categoryIndex: event.categoryIndex));
    await getIt<AppModel>().setCategory(event.categoryIndex);
  }
}