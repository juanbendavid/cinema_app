import 'package:flutter/material.dart';

import '../../../domain/entities/movie.dart';

class MovieHorizontalListview extends StatelessWidget {
  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;

  const MovieHorizontalListview(
      {super.key,
      required this.movies,
      this.title,
      this.subTitle,
      this.loadNextPage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if (title != null || subTitle != null)
            _Title(title: title!, subTitle: subTitle!)
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String title;
  final String subTitle;
  const _Title({required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Text(title, style: textStyle),
          const Spacer(),
          FilledButton.tonal(
            style: const ButtonStyle(visualDensity: VisualDensity.compact),
            onPressed: () {}, child: Text(subTitle))
            
        ],
      ),
    );
  }
}
