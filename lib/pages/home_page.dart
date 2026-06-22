import 'package:flutter/material.dart';
import 'home_tab.dart';
import 'now_playing_page.dart';
import 'favorite_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomeTab(),
    NowPlayingPage(),
    FavoritePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text(
          'CinePick',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white, // ⭐ 글씨 흰색
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        backgroundColor: Colors.black, // ⭐ 바 배경

        selectedItemColor: Colors.red, // 선택된 탭
        unselectedItemColor: Colors.grey, // 안 선택된 탭

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: '상영 중'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: '찜한 목록'),
        ],
      ),
    );
  }
}
