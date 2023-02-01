part of 'everything_bloc.dart';

abstract class EverythingEvent extends Equatable {
  const EverythingEvent();

  @override
  List<Object?> get props => [];
}

class BlocEventEverything extends EverythingEvent {
  final String? q;
  final String? language;
  final String? from;

  const BlocEventEverything(this.q, this.language, this.from); 

  @override
  List<Object?> get props => [q, language, from];
}