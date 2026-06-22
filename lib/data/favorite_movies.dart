import '../models/movie.dart';

List<Movie> favoriteMovies = [];

void toggleFavorite(Movie movie) {
  final index = favoriteMovies.indexWhere((m) => m.title == movie.title);

  if (index >= 0) {
    favoriteMovies.removeAt(index);
  } else {
    favoriteMovies.add(movie);
  }
}

bool isFavorite(Movie movie) {
  return favoriteMovies.any((m) => m.title == movie.title);
}
