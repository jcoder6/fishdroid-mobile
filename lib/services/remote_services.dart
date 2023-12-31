import 'package:fishdroid/data/fishes.dart';
import 'package:fishdroid/data/game_data.dart';
import 'package:fishdroid/data/hatch_video_data.dart';
import 'package:fishdroid/data/hatchery.dart';
import 'package:fishdroid/data/message.dart';
import 'package:fishdroid/data/nutrition_data.dart';
import 'package:fishdroid/data/recipe_data.dart';
import 'package:fishdroid/data/term.dart';
import 'package:fishdroid/data/trivia_data.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class RemoteService {
  final client = http.Client();
  final apiServer = 'http://192.168.0.195:8080/';
  // final apiServer = 'http://192.168.100.152:8080/';

  late final apiFishLink = '${apiServer}api/fishes/';
  late final apiRecipeLink = '${apiServer}api/recipes/';
  late final apiTermLink = '${apiServer}api/terms/';
  late final apiNutriLink = '${apiServer}api/nutritions/';
  late final apiTriviaLink = '${apiServer}api/trivia';
  late final apiHatcheryLink = '${apiServer}api/hatchery/';
  late final apiHatchVideoLink = '${apiServer}api/hatchvideos/';
  late final apiGameLink = '${apiServer}api/game/';
  late final apiMessageLink = '${apiServer}api/message';

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

  rowCount() async{
    final uri = Uri.parse('${apiFishLink}getRowCount/1');

    var response = await client.get(uri);
    if(response.statusCode == 200){
      return int.parse(response.body);
    }
    return null;
  }

  Future<List<Fish>?> fishPagination(page) async {
    final uri = Uri.parse('${apiFishLink}pagination/$page');
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

  Future<List<Recipe>?> allRecipes() async {
    final uri = Uri.parse('${apiRecipeLink}getRandomRecipe/p');
    var response = await client.get(uri);

    if(response.statusCode == 200){
      var json = response.body;
      print(json);
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

  /*
    TERM API
  */

  Future<List<Term>?> getTerms() async {
    final uri = Uri.parse(apiTermLink);
    var response = await client.get(uri);

    if(response.statusCode == 200) {
      var json = response.body;
      return termFromJson(json);
    }

    return null;
  } 

  Future<List<Term>?> getOneTerm(id) async {
    final uri = Uri.parse(apiTermLink + id);
    var response = await client.get(uri);

    if(response.statusCode == 200) {
      var json = response.body;
      return termFromJson(json);
    }
    return null;
  }

  Future<List<Term>?> searchTerm(input) async {
    final uri = Uri.parse('${apiTermLink}search/$input');
    var response = await client.get(uri);

    if(response.statusCode == 200){
      var json = response.body;
      return termFromJson(json);
    }
    return null;
  }

  /*
    NUTRITION API
  */

  Future<List<NutriList>?> getNutritions(fishId) async {
    final uri = Uri.parse(apiNutriLink + fishId);
    var response = await client.get(uri);

    if(response.statusCode == 200){
      var json = response.body;
      return nutriListFromJson(json);
    }

    return null;
  }

  Future<TriviaData?> getRandomTrivia() async {
    final uri = Uri.parse(apiTriviaLink);
    var response = await client.get(uri);

    if(response.statusCode == 200){
      var json = response.body;
      // print(triviaDataFromJson(json));
      return triviaDataFromJson(json);
    }

    return null;
  }

  /*
    HATCHERY API
  */

  Future<List<HatcheryData>?> getHatchery() async {
    final uri = Uri.parse(apiHatcheryLink);
    var response = await client.get(uri);

    if(response.statusCode == 200){
      var json = response.body;
      return hatcheryDataFromJson(json);
    }
    return null;
  } 

  Future<List<HatcheryData>?> getOneHatchery(id) async {
    final uri = Uri.parse(apiHatcheryLink + id.toString());
    var response = await client.get(uri);

    if(response.statusCode == 200){
      var json = response.body;
      return hatcheryDataFromJson(json);
    }
    return null;
  } 

  Future<List<HatchVideoData>?> hatchVideos(id) async {
    final uri = Uri.parse('${apiHatchVideoLink}videobyid/$id');
    var response = await client.get(uri);
    if(response.statusCode == 200){
      var json = response.body;
      // print(json);
      return hatchVideoDataFromJson(json);
    }
    return null;
  }

  /*
    GAME API
  */ 
  Future<GameData?> gameRandomData() async {
    final uri = Uri.parse(apiGameLink);
    var response = await client.get(uri);
    if(response.statusCode == 200){
      var json = response.body;
      // print(json);
      return gameDataFromJson(json);
    }
    return null;
  }

  /*
    MESSAGE API
  */ 

  Future<SendMessage?> sendMessage(messageData) async {
    final uri = Uri.parse(apiMessageLink);
    var response = await client.post(uri, body: messageData);
    if(response.statusCode == 201){
      var json = response.body;
      // print(response.body);
      return sendMessageFromJson(json);
    }
    return null;
  }
}