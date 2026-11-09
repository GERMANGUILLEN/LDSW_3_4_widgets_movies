import 'package:flutter/material.dart';

import 'services/pokemon_service.dart';

class PokemonScreen extends StatelessWidget {
  PokemonScreen({super.key});

  final PokemonService service = PokemonService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      AppBar(title: const Text('Datos obtenidos desde Internet')),
      body: FutureBuilder<Map<String, dynamic>>(
        future: service.getPokemon(),

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          final pokemon = snapshot.data!;

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(pokemon['image'], width: 200),

                const SizedBox(height: 20),

                Text(
                  pokemon['name'].toString().toUpperCase(),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text('Altura: ${pokemon['height']}'),

                Text('Peso: ${pokemon['weight']}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
