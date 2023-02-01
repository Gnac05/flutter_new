import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_news/features/news_api/domain/entities/new.dart';
import 'package:flutter_news/features/news_api/domain/uses_cases/get_new_top_headlines.dart';

part 'top_headlines_event.dart';
part 'top_headlines_state.dart';

class TopHeadlinesBloc extends Bloc<TopHeadlinesEvent, TopHeadlinesState> {
  final GetNewTopHeadlines getNewTopHeadlines;
  TopHeadlinesBloc(this.getNewTopHeadlines) : super(TopHeadlinesInitial()) {
    on<BlocEventTopHeadlines>(onGetTopHeadlines);
  }
  Future<void> onGetTopHeadlines(event, emit) async{
      emit(TopHeadlinesLoading());
      try {
        final newApi = await getNewTopHeadlines.execute(event.q, event.country, event.category);
        emit(TopHeadlinesReady(newApi: newApi));
      } catch (e) {
        emit(TopHeadlinesError(message: e.toString() ));
      }
    }
}