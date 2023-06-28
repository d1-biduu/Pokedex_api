import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pokemon_api/Controllers/pokemon_controller.dart';
import 'package:pokemon_api/Model/pokemon_model.dart';

class DetailsPage extends StatefulWidget {
  String? pokemonUrl;
  int pokemonId;
  DetailsPage({super.key, required this.pokemonUrl, required this.pokemonId});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  PokemonController pokemonController = Get.find<PokemonController>();

  @override
  void initState() {
    super.initState();
    pokemonController.fetchPokemonDetails(widget.pokemonId);
    print("pokemonId: ${widget.pokemonId}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 238, 242),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 249, 238, 242),
        title: const Center(
            child: Text(
          'Pokedex',
          style: TextStyle(
              color: Colors.pink,
              fontSize: 20,
              fontWeight: FontWeight.w800,
              letterSpacing: 1),
        )),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.infinity,
        child: Obx(
          () {
            final pokemonDetail = pokemonController.pokemonDetails.value;

            if (pokemonDetail == null) {
              return Center(child: CircularProgressIndicator());
            } else {
              print('thevalueis ${pokemonDetail.baseExperience}');
              print('thspriteis ${pokemonDetail.sprite}');
              return SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 200,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Column(
                          children: [
                            Text(
                              'Base Experience: ${pokemonDetail.baseExperience.toString()}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700),
                            ),
                            Image.network('${pokemonDetail.sprite?.image}', scale: 0.5,),
                            Text(
                              'Height: ${pokemonDetail.height.toString()}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700),
                            ),
                             Text(
                              'Type: ${pokemonDetail.types.toString()}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700),
                            ),
                           
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ]),
              );
            }
          },
        ),
      ),
    );
  }
}
