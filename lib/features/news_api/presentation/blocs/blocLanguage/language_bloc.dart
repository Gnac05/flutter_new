import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/core/config/di.dart';
import 'package:flutter_news/core/model/app_model.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageInitial()) {
    on<LanguageUpdate>(updateLanguage);
  }
  Future<void> updateLanguage(event, emit) async{
    emit(LanguageReady(newLanguage: event.newLanguage));
    getIt<AppModel>().setLanguage(event.newLanguage);
    // emit(LanguageInitial(initialLanguage: event.newLanguage));
  }
  
}
