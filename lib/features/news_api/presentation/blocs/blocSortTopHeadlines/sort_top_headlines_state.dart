part of 'sort_top_headlines_bloc.dart';

abstract class SortTopHeadlinesState extends Equatable {
  const SortTopHeadlinesState();
  
  @override
  List<Object> get props => [];
}

/// [pour renseigner un mot ou une phrase]
class SortTopHeadlinesInitialQ extends SortTopHeadlinesState {
  final TextEditingController controller = getIt<AppModel>().text2Contoller(getIt<AppModel>().getTopHeadlinesQ()?? '');
  @override
  List<Object> get props => [controller];
}

class SortTopHeadlinesReadyQ extends SortTopHeadlinesState {
  final TextEditingController controller;

  const SortTopHeadlinesReadyQ({required this.controller});
  @override
  List<Object> get props => [controller];
}

/// [pour renseigner le pays dans lequel on veut voir le new]
class SortTopHeadlinesInitialCountry extends SortTopHeadlinesState {
  final int countryIndex = getIt<AppModel>().getCountry()?? 0; 
  @override
  List<Object> get props => [countryIndex];
}

class SortTopHeadlinesReadyCountry extends SortTopHeadlinesState {
  final int countryIndex;

  const SortTopHeadlinesReadyCountry({required this.countryIndex});
  @override
  List<Object> get props => [countryIndex];
}

/// [pour renseigner la catégorie dans laquelle on veut voir le new]
class SortTopHeadlinesInitialCategory extends SortTopHeadlinesState {
  final int categoryIndex = getIt<AppModel>().getCategory()?? 0; 
  @override
  List<Object> get props => [categoryIndex];
}

class SortTopHeadlinesReadyCategory extends SortTopHeadlinesState {
  final int categoryIndex;

  const SortTopHeadlinesReadyCategory({required this.categoryIndex});
  @override
  List<Object> get props => [categoryIndex];
}