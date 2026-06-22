import 'package:flutter/material.dart';
import '../data/movie_data.dart';
import '../models/movie.dart';
import 'detail_page.dart';

class NowPlayingPage extends StatelessWidget {
  const NowPlayingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Movie> nowPlayingMovies = movies
        .where((movie) => movie.isNowPlaying)
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Now Playing')),
      body: ListView.builder(
        itemCount: nowPlayingMovies.length,
        itemBuilder: (context, index) {
          final movie = nowPlayingMovies[index];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: ListTile(
              leading: Image.network(
                movie.poster,
                width: 50,
                fit: BoxFit.cover,
              ),

              title: Text(movie.title),

              subtitle: Text(
                movie.summary,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => DetailPage(movie: movie)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
