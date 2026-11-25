import 'package:flutter/material.dart';

import 'movie_detail_screen.dart';
import '../models/movie.dart';
import '../services/firestore_service.dart';

class CatalogScreen extends StatelessWidget {
  CatalogScreen({super.key});

  final FirestoreService service = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catálogo de Películas')),

      body: StreamBuilder<List<Movie>>(
        stream: service.getMovies(),

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay películas registradas'));
          }

          final movies = snapshot.data!;

          return ListView.builder(
            itemCount: movies.length,

            itemBuilder: (context, index) {
              final movie = movies[index];

return Card(
  margin: const EdgeInsets.all(10),

  child: ListTile(

    onTap: () {

      Navigator.push(
        context,

        MaterialPageRoute(
          builder: (_) =>
              MovieDetailScreen(
                  movie: movie),
        ),
      );
    },
            },
          );
        },
      ),
    );
  }
}
