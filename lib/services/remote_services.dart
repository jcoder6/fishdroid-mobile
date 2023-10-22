import 'package:fishdroid/data/fishes.dart';
import 'package:fishdroid/data/recipe_data.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  final client = http.Client();
  final apiFishLink = 'http://localhost:8000/api/fishes/';
  final apiRecipeLink = 'http://localhost:8000/api/recipes/';

  /*
    FISH API
  */
  Future<List<Fish>?> getFishes() async {
    final uri = Uri.parse(apiFishLink);
    var response = await client.get(uri);

    if(response.statusCode == 200){
      var json = response.body;
      return fishFromJson(json);
    }
    return null;

  }
  
  Future<List<Fish>?> getOneFish(id) async {
    final uri = Uri.parse(apiFishLink + id.toString());
    var response = await client.get(uri);

    if(response.statusCode == 200){
      var json = response.body;
      return fishFromJson(json);
    }
    return null;
  }

  Future<List<Fish>?> searchFish(input) async {
    final uri = Uri.parse('${apiFishLink}search/$input');
    var response = await client.get(uri);

    if(response.statusCode == 200) {
      var json = response.body;
      return fishFromJson(json);
    }
    return null;
  }

  /*
    RECIPE API
  */

  Future<List<Recipe>?> getRecipes() async {
    final uri = Uri.parse(apiRecipeLink);
    var response = await client.get(uri);

    if(response.statusCode == 200){
      var json = response.body;
      return recipeFromJson(json);
    }
    return null;
  }

  Future<List<Recipe>?> getOneRecipe(id) async {
    final uri = Uri.parse(apiRecipeLink + id);
    var response = await client.get(uri);

    if(response.statusCode == 200){
      var json = response.body;
      return recipeFromJson(json);
    }
    return null;
  }

  Future<List<Recipe>?> getFishRecipes(id) async {
    final uri = Uri.parse('${apiRecipeLink}fishbyid/$id');
    var response = await client.get(uri);

    if(response.statusCode == 200){
      var json = response.body;
      return recipeFromJson(json);
    }
    return null;
  }
}