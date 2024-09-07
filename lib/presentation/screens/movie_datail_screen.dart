import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:movie_search/data/models/uni_search_model.dart';
import '../../config/app_colors.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key, this.movie});
  final Docs? movie;

  @override
  Widget build(BuildContext context) {
    const double containerHeight = 483;
    final double appBarHeight = AppBar().preferredSize.height;
    final double topPosition = appBarHeight + 40;
    String? movieName = movie?.name ?? movie?.enName ?? movie?.alternativeName;

    String genres = movie?.genres?.map((genre) => genre.name).join(', ') ??
        'No genres available';

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
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
          ),
          Positioned(
            child: SingleChildScrollView(
              child: ClipRRect(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        movie?.poster?.url != null &&
                                movie!.poster!.url!.isNotEmpty
                            ? Image.network(
                                '${movie?.poster?.url}',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 552,
                              )
                            : Image.network(
                                'https://i.pinimg.com/564x/d8/07/b7/d807b7810d2c217ea58fb82008b29c45.jpg',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 552,
                              ),
                        Positioned.fill(
                          child: BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                            child: Container(
                              color: Colors.black.withOpacity(0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 50, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '$movieName',
                            style: const TextStyle(
                                color: AppColors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.w700),
                          ),
                          const Gap(10),
                          movie?.ageRating != null
                              ? Text(
                                  '${movie?.year}  | ${'${movie?.ageRating}+'}',
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                )
                              : const SizedBox(),
                          const Gap(7),
                          Text(
                            genres,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const Gap(17),
                          movie?.description != null &&
                                  movie!.description!.isNotEmpty
                              ? const Text(
                                  'Description',
                                  style: TextStyle(color: AppColors.white),
                                )
                              : const SizedBox(),
                          const Gap(10),
                          movie?.description != null &&
                                  movie!.description!.isNotEmpty
                              ? Text(
                                  '${movie!.description}',
                                  style:
                                      const TextStyle(color: AppColors.white),
                                )
                              : const SizedBox()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: (MediaQuery.of(context).size.width - 327) / 2,
            top: topPosition,
            child: Container(
              width: 327,
              height: containerHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: movie?.poster?.url != null &&
                          movie!.poster!.url!.isNotEmpty
                      ? NetworkImage('${movie?.poster?.url}')
                      : const NetworkImage(
                          'https://i.pinimg.com/564x/8d/01/e6/8d01e679aed2ea6c444320880498c5f8.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
