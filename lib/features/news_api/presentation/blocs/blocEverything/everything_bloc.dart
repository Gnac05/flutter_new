import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_news/features/news_api/domain/uses_cases/get_new_everything.dart';

import '../../../domain/entities/new.dart';

part 'everything_event.dart';
part 'everything_state.dart';

class EverythingBloc extends Bloc<EverythingEvent, EverythingState> {
  final GetNewEverything getNewEverything;
  EverythingBloc(this.getNewEverything) : super(EverythingInitial()) {
    on<BlocEventEverything>(onGetEverything);
  }

  Future<void> onGetEverything(event, emit) async {
    emit(EverythingLoading());
    try {
      final newApi =
          await getNewEverything.execute(event.q, event.language, event.from);
      emit(EverythingReady(newApi: newApi));
    } catch (e) {
      emit(EverythingError(message: e.toString()));
    }
  }
}
