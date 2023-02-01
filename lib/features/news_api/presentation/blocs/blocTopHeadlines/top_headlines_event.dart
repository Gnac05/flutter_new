part of 'top_headlines_bloc.dart';

abstract class TopHeadlinesEvent extends Equatable {
  const TopHeadlinesEvent();

  @override
  List<Object?> get props => [];
}
class BlocEventTopHeadlines extends TopHeadlinesEvent {
  final String? q;
  final String? category;
  final String? country;

  const BlocEventTopHeadlines(this.q, this.category, this.country);

  @override
  List<Object?> get props => [q, category, country];
}