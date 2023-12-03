import 'package:cinema_app/presentations/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/movie.dart';

final movieInfoProvider = StateNotifierProvider<MovieMapNotifier,Map<String,Movie>>((ref){
  final movieRepository = ref.watch(movieRepositoryProvider);
  return MovieMapNotifier(getMovie: movieRepository.getMovieById);
});

typedef GetMovieCallBack = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallBack getMovie;

  MovieMapNotifier({required this.getMovie}) : super({});

  Future<void> loadMovie(String movieId)async{
    if (state[movieId]!=null) return;
    print("obteniendo pelicula");
    final movie = await getMovie(movieId);
    state = {...state, movieId:movie};  
    
  }
}
