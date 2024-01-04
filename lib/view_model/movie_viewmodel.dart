import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_plus/model/movie_response.dart';
import 'package:movie_plus/repository/movie_repository.dart';

class MovieViewModel extends ChangeNotifier {
  final _repo = MovieRepository();
  bool loading = false;
  final List<Results> movieList = [];

  getMovies() async {
    loading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    loading = false;
    notifyListeners();
    movieList.addAll(await _repo.getMovies());
    notifyListeners();
  }
}
