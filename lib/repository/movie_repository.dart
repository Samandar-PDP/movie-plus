import 'package:movie_plus/manager/api_service.dart';
import 'package:movie_plus/model/movie_response.dart';

class MovieRepository {
  final _api = ApiService(buildDioClient("https://api.themoviedb.org/"));
  
  Future<List<Results>> getMovies() async {
    try {
      final response = await _api.getMovies("8c2bbadabd465e81466586449631be0f");
      return response.results ?? [];
    } catch(e) {
      return [];
    }
  }

  Future<List<Results>> searchMovies(String query) async {
    try {
      final response = await _api.searchMovies("8c2bbadabd465e81466586449631be0f", query);
      return response.results ?? [];
    } catch(e) {
      print(e);
      return [];
    }
  }
}