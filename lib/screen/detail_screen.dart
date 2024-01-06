import 'package:flutter/material.dart';
import 'package:movie_plus/model/movie_response.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.movie});

  final Results movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title ?? ""),
      ),
    );
  }
}
