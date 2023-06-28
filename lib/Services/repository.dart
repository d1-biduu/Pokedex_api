import 'package:dio/dio.dart';
import 'package:pokemon_api/Model/pokemon_model.dart';

class Apifetch {
  Dio dio = Dio();
  Future<List<Pokemon>> getPokemonList() async {
    try {

      var response = await Dio().get('https://pokeapi.co/api/v2/pokemon?limit=151');
      List<Pokemon> pokemon = (response.data["results"] as List)
          .map((e) => Pokemon.fromJson(e))
          .toList();
         
      return pokemon;
    } catch (e) {
      throw e;
    }
  }




Future<Pokemon> getPokemonDetails(int id) async {
    try {
      var response = await Dio().get('https://pokeapi.co/api/v2/pokemon/$id/');
      print(response);
      Pokemon pokemon =Pokemon.fromJson(response.data);
      return pokemon;
      
    } catch (e) {
      throw e;
    }
  }
}