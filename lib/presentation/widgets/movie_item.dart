import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../config/app_colors.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    super.key,
    this.photo,
    this.movieName,
    this.genre,
    this.ageLimit,
    this.isSearched = false,
  });

  final String? photo;
  final String? movieName;
  final List<String>? genre;
  final int? ageLimit;
  final bool isSearched;

  @override
  Widget build(BuildContext context) {
    return isSearched
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: AppColors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: Image.network(
                      photo ??
                          'https://i.pinimg.com/564x/8d/01/e6/8d01e679aed2ea6c444320880498c5f8.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Gap(20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movieName ?? 'movie name',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Gap(4),
                      Text(
                        genre != null ? genre!.join(', ') : '',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        ageLimit != null ? '$ageLimit+' : '',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: AppColors.white,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Image.network(
                    photo ??
                        'https://i.pinimg.com/564x/8d/01/e6/8d01e679aed2ea6c444320880498c5f8.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Gap(8),
              Text(
                movieName ?? 'movie name',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Gap(4),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      genre != null ? genre!.join(', ') : '',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    ageLimit != null ? '$ageLimit+' : '',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ],
          );
  }
}
