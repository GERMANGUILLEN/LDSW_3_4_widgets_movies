import 'dart:convert';

import 'package:http/http.dart' as http;

class PokemonService {
  Future<Map<String, dynamic>> getPokemon() async {
    final response = await http.get(
      Uri.parse('https://pokeapi.co/api/v2/pokemon/pikachu'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return {
        'name': data['name'],

        'height': data['height'],

        'weight': data['weight'],

        'image': data['sprites']['front_default'],
      };
    } else {
      throw Exception('Error al obtener Pokémon');
    }
  }
}
