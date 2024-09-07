import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_search/data/repo/movie_repo.dart';
import 'package:movie_search/presentation/cubit/movie_cubit.dart';
import 'package:provider/provider.dart';

import 'presentation/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        RepositoryProvider(
          create: (_) => MovieRepo(),
        ),
        BlocProvider(
            create: (context) => MovieCubit(
                movieRepo: RepositoryProvider.of<MovieRepo>(context)))
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
