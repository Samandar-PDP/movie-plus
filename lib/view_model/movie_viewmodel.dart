import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_plus/model/movie_response.dart';
import 'package:movie_plus/repository/movie_repository.dart';

class MovieViewModel extends ChangeNotifier {
  final _repo = MovieRepository();
  bool loading = false;
  final List<Results> movieList = [];
  final List<Results> movieList2 = []; /// 1

  getMovies() async {
    loading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    loading = false;
    notifyListeners();
    movieList.addAll(await _repo.getMovies());
    movieList2.addAll(movieList); /// 2
    movieList2.shuffle(); /// 3
    notifyListeners();
  }
  searchMovies(String query) async {
    await Future.delayed(const Duration(seconds: 1));
    if(query.isNotEmpty) {
      loading = true;
      notifyListeners();
      movieList.clear();
      movieList.addAll(await _repo.searchMovies(query));
      loading = false;
      notifyListeners();
    } else {
      movieList.clear();
      movieList.addAll(movieList2);
      loading = false;
      notifyListeners();
    }
  }
}
