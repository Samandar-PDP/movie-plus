import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_plus/screen/detail_screen.dart';
import 'package:movie_plus/view_model/movie_viewmodel.dart';
import 'package:provider/provider.dart';

class FeedPage extends StatefulWidget {
  FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  late MovieViewModel _viewModel;
  bool _isFirstTime = false;

  @override
  void initState() {
    _isFirstTime = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(_isFirstTime) {
      _viewModel = Provider.of<MovieViewModel>(context);
      _viewModel.getMovies();
      _isFirstTime = false;
    }

    return Scaffold(
      appBar: AppBar(
        title: SearchBar(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
          backgroundColor: MaterialStateProperty.all(Colors.lightBlue.shade50),
          elevation: MaterialStateProperty.all(0),
          hintText: "Search...",
          onChanged: (query) => _viewModel.searchMovies(query),
        ),
      ),
      body: _viewModel.loading ? const Center(
        child: CircularProgressIndicator(),
      ) : ListView (
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Recent',
              style: TextStyle(fontSize: 20),
            ),
          ),
          if(_viewModel.movieList.isNotEmpty)
            _buildCarusel(),
          const SizedBox(height: 20),
          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text("For you"),
          ),
          SizedBox(
            width: double.infinity,
            height: 150,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: _viewModel.movieList2.length,
              itemBuilder: (context, index) => OpenContainer(
                closedElevation: 0,
                closedBuilder: (context, invoke)  {
                  final item = _viewModel.movieList2[index];
                  return Container(
                    padding: EdgeInsets.all(16),
                    height: 200,
                    width: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                          "https://image.tmdb.org/t/p/w500${item.posterPath}",
                          fit: BoxFit.cover),
                    ),
                  );
                },
                openBuilder: (context, invoke) => DetailScreen(movie: _viewModel.movieList2[index]),
              ),
            ),
          )
        ],
      ),
    );
  }
  _buildCarusel() {
    return CarouselSlider.builder(
      options: CarouselOptions(
          height: 400, viewportFraction: 0.7, enlargeCenterPage: true),
      itemCount: _viewModel.movieList.length,
      itemBuilder: (context, index, pageIndex) => OpenContainer(
        closedElevation: 0,
        closedBuilder: (context, invoke) {
        final movie = _viewModel.movieList[index];
        return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
                "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                fit: BoxFit.cover)));
        },
        openBuilder: (context, invoke) => DetailScreen(movie: _viewModel.movieList[index]),
      ),
    );
  }
}
