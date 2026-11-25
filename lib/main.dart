import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screens/catalog_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MovieCatalogApp());
}

class MovieCatalogApp extends StatelessWidget {
  const MovieCatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Catalog',
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo //
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/movies_background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Capa oscura //
          Container(color: Colors.black54),

          // Contenido principal //
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.movie_creation_outlined,
                  size: 80,
                  color: Colors.white,
                ),

                const SizedBox(height: 15),

                const Text(
                  'Bienvenido al catálogo de películas',
                  style: TextStyle(color: Colors.white70, fontSize: 18),
                ),

                const SizedBox(height: 40),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CatalogScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                  ),
                  child: const Text('Explorar Películas'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
