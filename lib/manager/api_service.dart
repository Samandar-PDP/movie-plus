import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../model/movie_response.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('3/movie/popular')
  Future<MovieResponse> getMovies(@Query('api_key') String apiKey);

  @GET('3/search/movie')
  Future<MovieResponse> searchMovies(@Query('api_key') String apiKey, @Query("query") String query);
}
Dio buildDioClient(String base) {
  final dio = Dio()..options = BaseOptions(baseUrl: base);
  dio.interceptors.add(
    PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90)
  );
  return dio;
}