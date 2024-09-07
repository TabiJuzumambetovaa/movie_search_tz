import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../config/app_colors.dart';
import '../cubit/movie_cubit.dart';
import '../widgets/movie_item.dart';
import 'movie_datail_screen.dart';

class CustomSearchBar extends StatelessWidget {
  final MovieCubit movieCubit;

  const CustomSearchBar(this.movieCubit, {super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.search, color: AppColors.violet),
      onPressed: () {
        showSearch(
          context: context,
          delegate: MovieSearchDelegate(movieCubit),
        );
      },
    );
  }
}

class MovieSearchDelegate extends SearchDelegate<String> {
  final MovieCubit movieCubit;

  MovieSearchDelegate(this.movieCubit);

  @override
  Widget buildSuggestions(BuildContext context) {
    return Scaffold(
      // appBar:AppBar(
      //   backgroundColor: AppColors.black ,
      // ) ,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.violet,
              AppColors.black,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: BlocBuilder<MovieCubit, MovieState>(
          bloc: movieCubit,
          builder: (context, state) {
            final suggestions = query.isEmpty
                ? []
                : (state is MovieSuccess
                    ? state.uniSearch?.docs?.where((movie) {
                        final movieName =
                            movie.name ?? movie.enName ?? movie.alternativeName;
                        final genres = movie.genres
                                ?.map((genre) => genre.name?.toLowerCase())
                                .toList() ??
                            [];

                        final matchesName = movieName
                                ?.toLowerCase()
                                .contains(query.toLowerCase()) ??
                            false;
                        final matchesGenre = genres.any((genre) =>
                            genre?.contains(query.toLowerCase()) ?? false);

                        return matchesName || matchesGenre;
                      }).toList()
                    : []);

            return ListView.builder(
              itemCount: suggestions?.length,
              itemBuilder: (context, index) {
                final suggestion = suggestions?[index];
                final movieName = suggestion?.name ??
                    suggestion?.enName ??
                    suggestion?.alternativeName;
                return ListTile(
                  title: Text(movieName ?? 'No name',
                      style: const TextStyle(color: AppColors.black)),
                  onTap: () {
                    query = movieName ?? '';
                    showResults(context);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    movieCubit.searchMovies(query);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.violet,
              AppColors.black,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: BlocBuilder<MovieCubit, MovieState>(
          bloc: movieCubit,
          builder: (context, state) {
            if (state is MovieLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MovieError) {
              return Center(
                  child: Text('Oops! Error: ${state.message}',
                      style: const TextStyle(color: AppColors.black)));
            } else if (state is MovieSuccess) {
              final results = state.uniSearch?.docs?.where((movie) {
                    final movieName =
                        movie.name ?? movie.enName ?? movie.alternativeName;
                    final genres = movie.genres
                            ?.map((genre) => genre.name?.toLowerCase())
                            .toList() ??
                        [];

                    final matchesName = movieName
                            ?.toLowerCase()
                            .contains(query.toLowerCase()) ??
                        false;
                    final matchesGenre = genres.any((genre) =>
                        genre?.contains(query.toLowerCase()) ?? false);

                    return matchesName || matchesGenre;
                  }).toList() ??
                  [];

              if (results.isEmpty) {
                return const Center(
                  child: Text('Results not found',
                      style: TextStyle(color: AppColors.white)),
                );
              }

              return ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  final result = results[index];
                  List<String>? genres =
                      (result.genres?.map((genre) => genre.name).toList() ?? [])
                          .cast<String>();
                  final movieName =
                      result.name ?? result.enName ?? result.alternativeName;
                  return ListTile(
                    title: MovieItem(
                      photo: result.poster?.url,
                      movieName: movieName,
                      ageLimit: result.ageRating,
                      genre: genres,
                      isSearched: true,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MovieDetailScreen(movie: result),
                        ),
                      );
                    },
                  );
                },
              );
            } else {
              return const Center(
                  child: Text('No results found',
                      style: TextStyle(color: AppColors.white)));
            }
          },
        ),
      ),
    );
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios, color: AppColors.black),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear, color: AppColors.black),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }
}
