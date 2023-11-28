import 'package:cinema_app/config/constants/environment.dart';
import 'package:cinema_app/domain/datasources/movies_datasource.dart';
import 'package:cinema_app/domain/entities/movie.dart';
import 'package:cinema_app/domain/repositories/movies_repository.dart';
import 'package:cinema_app/infrastructure/mappers/movie_mapper.dart';
import 'package:cinema_app/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MovieDbDatasource extends MoviesDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Enviroment.theMovieDbKey,
        'language': 'es-MX'
      }));

  List<Movie> _DbResponseToMovieEntity(MovieDbResponse movieDbResponse) {
    final List<Movie> movies = movieDbResponse.results
        .map((moviedb) => MovieMapper.movireDbToEntity(moviedb))
        .toList();
    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});
    final movieDbResponse = MovieDbResponse.fromJson(response.data);

    return _DbResponseToMovieEntity(movieDbResponse);
  }

  @override
  Future<List<Movie>> getPoular({int page = 1}) async {
    final response =
        await dio.get('/movie/popular', queryParameters: {'page': page});
    final movieDbResponse = MovieDbResponse.fromJson(response.data);
    return _DbResponseToMovieEntity(movieDbResponse);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response =
        await dio.get('/movie/top_rated', queryParameters: {'page': page});
    final movieDbResponse = MovieDbResponse.fromJson(response.data);
    return _DbResponseToMovieEntity(movieDbResponse);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response =
        await dio.get('/movie/upcoming', queryParameters: {'page': page});
    final movieDbResponse = MovieDbResponse.fromJson(response.data);
    return _DbResponseToMovieEntity(movieDbResponse);
  }
}
