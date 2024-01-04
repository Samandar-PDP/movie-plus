import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
              itemCount: 20,
              itemBuilder: (context, index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(12),
                  child: Ink(
                    padding: EdgeInsets.all(16),
                    height: 200,
                    width: 150,
                    child: Image.network(
                        'https://images.unsplash.com/photo-1621155346337-1d19476ba7d6?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGltYWdlfGVufDB8fDB8fHww',
                        fit: BoxFit.cover),
                  ),
                );
              },
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
      itemBuilder: (context, index, pageIndex) {
        final movie = _viewModel.movieList[index];
        return Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                  "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                  fit: BoxFit.cover)),
        );
      },
    );
  }
}
