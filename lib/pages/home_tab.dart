import 'package:flutter/material.dart';
import '../data/movie_data.dart';
import '../models/movie.dart';
import '../data/favorite_movies.dart';
import 'detail_page.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final List<String> genres = ['전체', '액션', 'SF', '로맨스', '공포', '애니'];

  String selectedGenre = '전체';
  String searchText = '';

  List<Movie> get filteredMovies {
    return movies.where((movie) {
      final genreMatch = selectedGenre == '전체' || movie.genre == selectedGenre;

      final searchMatch = movie.title.toLowerCase().contains(
        searchText.toLowerCase(),
      );

      return genreMatch && searchMatch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final list = filteredMovies;

    return Column(
      children: [
        // 🔍 검색창
        Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            decoration: InputDecoration(
              hintText: '영화 검색',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (v) {
              setState(() => searchText = v);
            },
          ),
        ),

        // 🎭 장르 필터 바 (핵심 수정 부분)
        SizedBox(
          height: 40,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              children: genres.map((genre) {
                final isSelected = genre == selectedGenre;

                return GestureDetector(
                  onTap: () => setState(() => selectedGenre = genre),
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color.fromARGB(255, 203, 35, 23)
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      genre,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),

        const SizedBox(height: 10),

        // 🎬 영화 리스트
        Expanded(
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final movie = list[index];

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),

                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      movie.poster,
                      width: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (c, e, s) =>
                          const Icon(Icons.movie, size: 40),
                    ),
                  ),

                  title: Text(
                    movie.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),

                  subtitle: Text('${movie.genre}  ★ ${movie.rating}'),

                  trailing: IconButton(
                    icon: Icon(
                      isFavorite(movie)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      setState(() => toggleFavorite(movie));
                    },
                  ),

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailPage(movie: movie),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
