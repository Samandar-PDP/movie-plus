import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_plus/screen/favorite_page.dart';
import 'package:movie_plus/screen/feed_page.dart';
import 'package:movie_plus/screen/profile_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  
  int _selectedIndex = 0;
  final _titleList = [
    'Feed',
    'Favorite',
    'Profile'
  ];

  final _iconList = [
    CupertinoIcons.game_controller,
    CupertinoIcons.heart,
    CupertinoIcons.profile_circled,
  ];

  final List<Widget> _screens = [
    FeedPage(),
    FavoritePage(),
    ProfilePage(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/img/movie.png',width: 20,height: 20),
        ),
        title: Text(_titleList[_selectedIndex]),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.search))
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          SalomonBottomBarItem(icon: Icon(CupertinoIcons.game_controller), title: Text("Feed")),
          SalomonBottomBarItem(icon: Icon(CupertinoIcons.heart), title: Text("Favorite")),
          SalomonBottomBarItem(icon: Icon(CupertinoIcons.profile_circled), title: Text("Profile")),
        ],
      ),
    );
  }
}
