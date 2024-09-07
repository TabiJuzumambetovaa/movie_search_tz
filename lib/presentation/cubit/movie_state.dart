part of 'movie_cubit.dart';

@immutable
sealed class MovieState {}

final class MovieInitial extends MovieState {}

final class MovieLoading extends MovieState {}

final class MovieSuccess extends MovieState {
  final UniSearch? uniSearch;
  MovieSuccess({this.uniSearch});
}

final class MovieError extends MovieState {
  final String message;
  MovieError({required this.message});
}
