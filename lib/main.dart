import 'package:flutter/material.dart';
import 'package:movie_plus/screen/main_page.dart';
import 'package:movie_plus/view_model/movie_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MovieViewModel(),
      child: MaterialApp(
        title: "Movie Plus",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        home: const MainPage(),
      ),
    );
  }
}


