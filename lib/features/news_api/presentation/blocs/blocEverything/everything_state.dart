part of 'everything_bloc.dart';

abstract class EverythingState extends Equatable {
  const EverythingState();

  @override
  List<Object> get props => [];
}

class EverythingInitial extends EverythingState {}

class EverythingLoading extends EverythingState {}

class EverythingReady extends EverythingState {
  final New newApi;
  const EverythingReady({required this.newApi});

  @override
  List<Object> get props => [newApi];
}

class EverythingError extends EverythingState {
  final String message;
  const EverythingError({required this.message});

  @override
  List<Object> get props => [message];
}
