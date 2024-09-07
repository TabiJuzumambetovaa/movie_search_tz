import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/uni_search_model.dart';
import '../../data/repo/movie_repo.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit({required this.movieRepo}) : super(MovieInitial());
  final MovieRepo movieRepo;
  Future<void> getSearchMovie(int page) async {
    emit(MovieLoading());
    try {
      final UniSearch uniSearchModel = await movieRepo.searchMovies(page: page);
      emit(MovieSuccess(uniSearch: uniSearchModel));
    } catch (e) {
      emit(MovieError(message: e.toString()));
    }
  }

  Future<void> searchMovies(String query) async {
    emit(MovieLoading());
    try {
      final UniSearch uniSearchModel =
          await movieRepo.searchMovies(query: query);
      emit(MovieSuccess(uniSearch: uniSearchModel));
    } catch (e) {
      emit(MovieError(message: e.toString()));
    }
  }
}
