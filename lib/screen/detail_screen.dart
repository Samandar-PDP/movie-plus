import 'package:flutter/cupertino.dart';
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
      body: ListView(
        children: [
          Image.network("https://image.tmdb.org/t/p/w500${movie.backdropPath}"),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(movie.voteCount.toString(),style: TextStyle(fontSize: 20),),
                    const Icon(CupertinoIcons.star,color: Colors.orange,),
                    Expanded(child: Align(alignment: AlignmentDirectional.centerEnd,child: Icon(CupertinoIcons.bookmark),))
                  ],
                ),
                const SizedBox(height: 5,),
                Text(movie.overview.toString())
              ],
            ),
          )
        ],
      ),
    );
  }
}
