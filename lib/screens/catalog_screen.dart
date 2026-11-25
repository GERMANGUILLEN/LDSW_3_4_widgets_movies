import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../services/firestore_service.dart';
import 'movie_detail_screen.dart';

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
                        builder: (_) => MovieDetailScreen(movie: movie),
                      ),
                    );
                  },

                  leading: Image.network(
                    movie.imageUrl,
                    width: 60,
                    fit: BoxFit.cover,
                  ),

                  title: Text(movie.title),

                  subtitle: Text(movie.director),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),

                    onPressed: () async {
                      final confirmar = await showDialog<bool>(
                        context: context,

                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Eliminar película'),

                            content: Text('¿Deseas eliminar ${movie.title}?'),

                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, false);
                                },

                                child: const Text('Cancelar'),
                              ),

                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, true);
                                },

                                child: const Text('Eliminar'),
                              ),
                            ],
                          );
                        },
                      );

                      if (confirmar == true) {
                        await service.deleteMovie(movie.id);
                      }
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
