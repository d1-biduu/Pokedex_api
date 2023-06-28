import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pokemon_api/Screen/details.dart';

import '../Controllers/pokemon_controller.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final PokemonController pokemonController = Get.put(PokemonController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 238, 242),
      appBar: AppBar(
         backgroundColor: Color.fromARGB(255, 249, 238, 242),
        title: const Center(child: Text('Pokedex', style: TextStyle(color: Colors.pink, fontSize: 20, fontWeight: FontWeight.w800, letterSpacing: 1),)),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 60,
          ),
          Container(child: Expanded(
            child: Obx(() {
              if (pokemonController.isloading.value) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.blue,
                ));
              } else {
                return SingleChildScrollView(
                  child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 133,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 0.5,
                      ),
                      itemCount: pokemonController.pokemonList.length,
                      itemBuilder: (context, index) {
                        final List<Color> colors = [
                         Color.fromARGB(255, 50, 194, 201),
                        Color.fromARGB(255, 235, 109, 201),
                       
                          const Color.fromARGB(255, 198, 179, 7),
                       
                        ];
                        final colorIndex = index % colors.length;
                        final color = colors[colorIndex];
                        return Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailsPage(
                                                    pokemonUrl:
                                                        "${pokemonController.pokemonList[index].url}", pokemonId: index+1,
                                                  )));
                                    },
                                    child: Container(
                                      width: 151,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          color: color,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Center(
                                          child: Text(
                                        "${pokemonController.pokemonList[index].name}",

                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            letterSpacing: 1),
                                      )),

                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                );
                //   ListView.builder(
                //           itemCount: pokemonController.pokemonList.length,
                //           itemBuilder: (context, index) {
                //             final pokemon = pokemonController.pokemonList[index];
                //             return
                // SingleChildScrollView(
                //   child: Column(children: [
                //    Text("${pokemonController.pokemonList[index].name}",)
                //   ],)
                // );});}
              }
            }),
          )),
        ],
      ),
    );
  }
}
