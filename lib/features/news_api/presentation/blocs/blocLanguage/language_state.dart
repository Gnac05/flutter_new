part of 'language_bloc.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();

  @override
  List<Object> get props => [];
}

class LanguageInitial extends LanguageState {
  final int? initialLanguage = getIt<AppModel>().getLanguage();
    // LanguageInitial({ this.initialLanguage});
  @override
  List<Object> get props => [initialLanguage?? 0];
}

// class LanguageLoading extends LanguageState {}

// class LanguageError extends LanguageState {
//   final String message;

//   const LanguageError({required this.message});
//   @override
//   List<Object> get props => [message];
// }

class LanguageReady extends LanguageState {
  final int newLanguage;

  const LanguageReady({required this.newLanguage});

  @override
  List<Object> get props => [newLanguage];
}
