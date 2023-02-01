part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}

class  LanguageUpdate extends LanguageEvent {
  final int newLanguage;

  const LanguageUpdate({required this.newLanguage}); 

  @override
  List<Object> get props => [newLanguage];
}