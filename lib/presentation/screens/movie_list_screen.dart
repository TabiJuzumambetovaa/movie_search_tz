import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_search/presentation/cubit/movie_cubit.dart';
import '../../config/app_colors.dart';
import '../widgets/movie_item.dart';
import 'movie_datail_screen.dart';
import 'movie_search_delegate.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  int page = 1;

  @override
  void initState() {
    super.initState();
    context.read<MovieCubit>().getSearchMovie(page);
  }

  void loadNextPage() {
    setState(() {
      page++;
    });
    context.read<MovieCubit>().getSearchMovie(page);
  }

  void loadPreviousPage() {
    if (page > 1) {
      setState(() {
        page--;
      });
      context.read<MovieCubit>().getSearchMovie(page);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Movies",
          style: TextStyle(color: AppColors.white),
        ),
        backgroundColor: AppColors.violet,
        leading: Image.asset(
          'assets/png/photo.png',
          width: 24,
          height: 24,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: AppColors.white),
            onPressed: () {
              showSearch(
                context: context,
                delegate: MovieSearchDelegate(
                  BlocProvider.of<MovieCubit>(context),
                ),
              );
            },
          ),
        ],
      ),
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
          builder: (context, state) {
            if (state is MovieLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MovieSuccess) {
              return CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.all(16.0),
                    sliver: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                        childAspectRatio: 0.7,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final movie = state.uniSearch?.docs?[index];
                          String? movieName = movie?.name ??
                              movie?.enName ??
                              movie?.alternativeName;
                          List<String>? genres = (movie?.genres
                                      ?.map((genre) => genre.name)
                                      .toList() ??
                                  [])
                              .cast<String>();

                          return GestureDetector(
                            child: MovieItem(
                              photo: movie?.poster?.url,
                              movieName: movieName,
                              ageLimit: movie?.ageRating,
                              genre: genres,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MovieDetailScreen(movie: movie),
                                ),
                              );
                            },
                          );
                        },
                        childCount: state.uniSearch?.docs?.length ?? 0,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          if (page > 1)
                            TextButton(
                              onPressed: loadPreviousPage,
                              child: const Row(
                                children: [
                                  Icon(Icons.arrow_back_ios),
                                  Text('Previous page',
                                      style: TextStyle(fontSize: 16)),
                                ],
                              ),
                            ),
                          const Spacer(),
                          TextButton(
                            onPressed: loadNextPage,
                            child: const Row(
                              children: [
                                Text('Next page',
                                    style: TextStyle(fontSize: 16)),
                                Icon(Icons.arrow_forward_ios),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is MovieError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: AppColors.white),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
