import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {
  static const name = "movie-id";
  final String movieId;
  const MovieScreen({super.key, required this.movieId});
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(movieId),),
    );
  }
}