import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/core/config/di.dart';
import 'package:flutter_news/core/model/app_model.dart';

part 'sort_everything_event.dart';
part 'sort_everything_state.dart';

class SortEverythingQBloc
    extends Bloc<SortEverythingEvent, SortEverythingState> {
  SortEverythingQBloc() : super(SortEverythingInitialQ()) {
    on<EverythingQ>(onEverythingQ);
  }
  Future<void> onEverythingQ(event, emit) async {
    emit(SortEverythingReadyQ(
        controller: getIt<AppModel>().text2Contoller(event.text)));
    await getIt<AppModel>().setEverythingQ(event.text);
  }
}

class SortEverythingFromBloc
    extends Bloc<SortEverythingEvent, SortEverythingState> {
  SortEverythingFromBloc() : super(SortEverythingInitialFrom()) {
    on<EverythingFrom>(onEverythingFrom);
  }
  Future<void> onEverythingFrom(event, emit) async {
    emit(SortEverythingReadyFrom(from: event.from));
    await getIt<AppModel>().setFrom(event.from);
  }
}

class SortEverythingLanguageBloc
    extends Bloc<SortEverythingEvent, SortEverythingState> {
  SortEverythingLanguageBloc() : super(SortEverythingInitialLanguage()) {
    on<EverythingLanguage>(onEverythingLanguage);
  }
  Future<void> onEverythingLanguage(event, emit) async {
    emit(SortEverythingReadyLanguage(languageIndex: event.languageIndex));
    await getIt<AppModel>().setLanguage(event.languageIndex);
  }
}
