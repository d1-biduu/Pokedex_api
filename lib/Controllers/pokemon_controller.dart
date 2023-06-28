import 'package:get/get.dart';
import 'package:pokemon_api/Model/pokemon_model.dart';
import 'package:pokemon_api/Services/repository.dart';
class PokemonController extends GetxController
{

List<Pokemon> pokemonList =<Pokemon>[].obs;

Rx<Pokemon?> pokemonDetails = Rx<Pokemon?>(null);

Apifetch obj = Apifetch();
RxBool isloading = false.obs;
int? pokemonId;


@override
void onInit() {
    fetchPokemonList();
    if (pokemonId != null) {
fetchPokemonDetails(pokemonId!);
    }
   
   
    super.onInit();
  }
void fetchPokemonList() async {
  isloading(true);
  try{
  List<Pokemon> pokemon = await obj.getPokemonList();
 pokemonList = pokemon;
  }
  finally{
isloading(false);
  }

}
void fetchPokemonDetails(int id) async {
 
    try {
     
    var pokemon=   await obj.getPokemonDetails(id);
 
pokemonDetails.value = pokemon;
print('pokemonDetails: ${pokemonDetails.value!.baseExperience}');
    
  
      
    } finally {
      isloading(false);
    }
  }



}