part of 'sort_everything_bloc.dart';

abstract class SortEverythingEvent extends Equatable {
  const SortEverythingEvent();

  @override
  List<Object> get props => [];
}

class EverythingQ extends SortEverythingEvent {
  final String text;

  const EverythingQ({required this.text});
  @override
  List<Object> get props => [text];
}

class EverythingFrom extends SortEverythingEvent {
  final String from;

  const EverythingFrom({required this.from});
  @override
  List<Object> get props => [from];
}

class EverythingLanguage extends SortEverythingEvent {
  final int languageIndex;

  const EverythingLanguage({required this.languageIndex});
  @override
  List<Object> get props => [languageIndex];
}
