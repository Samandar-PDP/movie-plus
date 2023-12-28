import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Recent',
              style: TextStyle(fontSize: 20),
            ),
          ),
          CarouselSlider.builder(
            options: CarouselOptions(
                height: 400, viewportFraction: 0.8, enlargeCenterPage: true),
            itemCount: 10,
            itemBuilder: (context, index, pageIndex) {
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                        'https://images.unsplash.com/photo-1621155346337-1d19476ba7d6?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGltYWdlfGVufDB8fDB8fHww',
                        fit: BoxFit.cover)),
              );
            },
          ),
          const SizedBox(height: 20),
          Padding(
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
}
