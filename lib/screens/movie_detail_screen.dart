import 'package:flutter/material.dart';

import '../models/movie.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Center(child: Image.network(movie.imageUrl, height: 350)),

              const SizedBox(height: 20),

              Text(
                movie.title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text('Director: ${movie.director}'),

              Text('Año: ${movie.year}'),

              Text('Género: ${movie.genre}'),

              const SizedBox(height: 20),

              const Text(
                'Sinopsis',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              Text(movie.synopsis),
            ],
          ),
        ),
      ),
    );
  }
}
