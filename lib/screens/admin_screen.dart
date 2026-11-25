import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../services/firestore_service.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final FirestoreService service = FirestoreService();

  final titleController = TextEditingController();

  final yearController = TextEditingController();

  final directorController = TextEditingController();

  final genreController = TextEditingController();

  final synopsisController = TextEditingController();

  final imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Administración')),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            TextField(
              controller: titleController,

              decoration: const InputDecoration(labelText: 'Título'),
            ),

            TextField(
              controller: yearController,

              decoration: const InputDecoration(labelText: 'Año'),
            ),

            TextField(
              controller: directorController,

              decoration: const InputDecoration(labelText: 'Director'),
            ),

            TextField(
              controller: genreController,

              decoration: const InputDecoration(labelText: 'Género'),
            ),

            TextField(
              controller: synopsisController,

              decoration: const InputDecoration(labelText: 'Sinopsis'),
            ),

            TextField(
              controller: imageController,

              decoration: const InputDecoration(labelText: 'URL Imagen'),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                final movie = Movie(
                  id: '',

                  title: titleController.text,

                  year: int.parse(yearController.text),

                  director: directorController.text,

                  genre: genreController.text,

                  synopsis: synopsisController.text,

                  imageUrl: imageController.text,
                );

                await service.addMovie(movie);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Película guardada')),
                );
              },

              child: const Text('Guardar Película'),
            ),
          ],
        ),
      ),
    );
  }
}
