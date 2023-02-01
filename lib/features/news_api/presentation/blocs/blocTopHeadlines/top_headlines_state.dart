part of 'top_headlines_bloc.dart';

abstract class TopHeadlinesState extends Equatable {
  const TopHeadlinesState();
  
  @override
  List<Object> get props => [];
}

class TopHeadlinesInitial extends TopHeadlinesState {}
class TopHeadlinesLoading extends TopHeadlinesState {}
class TopHeadlinesReady extends TopHeadlinesState {
  final New newApi;

  const TopHeadlinesReady({required this.newApi});
  @override
  List<Object> get props => [newApi];
}
class TopHeadlinesError extends TopHeadlinesState{
  final String  message;

  const TopHeadlinesError({required this.message});
  @override
  List<Object> get props => [message];
}