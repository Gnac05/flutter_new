part of 'sort_top_headlines_bloc.dart';

abstract class SortTopHeadlinesEvent extends Equatable {
  const SortTopHeadlinesEvent();

  @override
  List<Object> get props => [];
}

class TopHeadlinesQ extends SortTopHeadlinesEvent {
  final String text;

  const TopHeadlinesQ({required this.text});
  @override
  List<Object> get props => [text];
}

class TopHeadlinesCategory extends SortTopHeadlinesEvent {
  final int categoryIndex;

  const TopHeadlinesCategory({required this.categoryIndex});
  @override
  List<Object> get props => [categoryIndex];
}

class TopHeadlinesCountry extends SortTopHeadlinesEvent {
  final int countryIndex;

  const TopHeadlinesCountry({required this.countryIndex});
  @override
  List<Object> get props => [countryIndex];
}