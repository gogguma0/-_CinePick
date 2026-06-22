import 'package:flutter/material.dart';
import '../data/favorite_movies.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return favoriteMovies.isEmpty
        ? const Center(
            child: Text('찜한 영화가 없습니다', style: TextStyle(fontSize: 16)),
          )
        : ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: favoriteMovies.length,
            itemBuilder: (context, index) {
              final movie = favoriteMovies[index];

              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 3,
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),

                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      movie.poster,
                      width: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (c, e, s) => const Icon(Icons.movie),
                    ),
                  ),

                  title: Text(
                    movie.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),

                  subtitle: Text(movie.genre),
                ),
              );
            },
          );
  }
}
