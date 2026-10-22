import 'package:flutter/material.dart';

void main() {
  runApp(const MovieCatalogApp());
}

class MovieCatalogApp extends StatelessWidget {
  const MovieCatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catálogo de Películas',
      home: Scaffold(
        appBar: AppBar(title: const Text('Catálogo de Películas')),
        body: Column(
          children: [
            // Text: título de sección //
            const Text(
              'Películas Populares',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            // Row: fila con íconos //
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.movie, color: Colors.red),
                SizedBox(width: 10),
                Text('Explora tu catálogo'),
              ],
            ),

            // Container: tarjeta de película //
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: const [
                  Text('Inception (2010)', style: TextStyle(fontSize: 18)),
                  Text('Director: Christopher Nolan'),
                ],
              ),
            ),

            // Stack: imagen con texto encima //
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: 200,
                  height: 300,
                  color: Colors.black12,
                  child: const Center(child: Text('Imagen de película')),
                ),
                Container(
                  color: Colors.black54,
                  padding: const EdgeInsets.all(5),
                  child: const Text(
                    'Inception',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
