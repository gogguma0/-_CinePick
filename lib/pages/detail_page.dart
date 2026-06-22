import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../data/favorite_movies.dart';

class DetailPage extends StatefulWidget {
  final Movie movie;

  const DetailPage({super.key, required this.movie});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool get isFav => isFavorite(widget.movie);

  void toggleFav() {
    setState(() {
      toggleFavorite(widget.movie);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: CustomScrollView(
        slivers: [
          // 🎬 포스터
          SliverAppBar(
            expandedHeight: 350,
            pinned: true,
            backgroundColor: Colors.black,
            iconTheme: const IconThemeData(color: Colors.white),

            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(widget.movie.poster, fit: BoxFit.cover),

                  // 어두운 그라데이션 (핵심 포인트)
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.8),
                          Colors.black,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 🎬 정보 영역 (검은 바 느낌)
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(20),
              color: Colors.black,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🎬 제목 + 찜
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.movie.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      IconButton(
                        icon: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                          color: Colors.red,
                          size: 30,
                        ),
                        onPressed: toggleFav,
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // ⭐ 장르 + 평점
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          widget.movie.genre,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '★ ${widget.movie.rating}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Text(
                    '감독: ${widget.movie.director}',
                    style: const TextStyle(color: Colors.white70),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    '출연: ${widget.movie.actors}',
                    style: const TextStyle(color: Colors.white70),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    '줄거리',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    widget.movie.summary,
                    style: const TextStyle(color: Colors.white70, height: 1.5),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
