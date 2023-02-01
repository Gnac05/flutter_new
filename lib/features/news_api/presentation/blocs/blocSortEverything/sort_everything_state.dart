part of 'sort_everything_bloc.dart';

abstract class SortEverythingState extends Equatable {
  const SortEverythingState();

  @override
  List<Object> get props => [];
}

// class SortEverythingInitial extends SortEverythingState {}

/// [pour renseigner un mot ou une phrase]
class SortEverythingInitialQ extends SortEverythingState {
  final TextEditingController controller = getIt<AppModel>().text2Contoller(getIt<AppModel>().getEverythingQ()?? 'Bénin');
  @override
  List<Object> get props => [controller];
}

class SortEverythingReadyQ extends SortEverythingState {
  final TextEditingController controller;

  const SortEverythingReadyQ({required this.controller});
  @override
  List<Object> get props => [controller];
}

/// [pour renseigner la date d'où commencé la recherche]
class SortEverythingInitialFrom extends SortEverythingState {
  final String from = getIt<AppModel>().getFrom()?? 'Taper pour choisir';
  @override
  List<Object> get props => [from];
}

class SortEverythingReadyFrom extends SortEverythingState {
  final String from;

  const SortEverythingReadyFrom({required this.from});
  @override
  List<Object> get props => [from];
}

/// [pour renseigner la langue dans laquelle on veut voir le new]
class SortEverythingInitialLanguage extends SortEverythingState {
  final int languageIndex = getIt<AppModel>().getLanguage()?? 0; 
  @override
  List<Object> get props => [languageIndex];
}

class SortEverythingReadyLanguage extends SortEverythingState {
  final int languageIndex;

  const SortEverythingReadyLanguage({required this.languageIndex});
  @override
  List<Object> get props => [languageIndex];
}
