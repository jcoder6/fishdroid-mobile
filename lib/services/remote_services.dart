import 'package:fishdroid/data/fishes.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  final client = http.Client();
  final apiLink = 'http://localhost:8000/api/fishes/';
  Future<List<Fish>?> getFishes() async {
    final uri = Uri.parse(apiLink);
    var response = await client.get(uri);

    if(response.statusCode == 200){
      var json = response.body;
      return fishFromJson(json);
    }
    return null;

  }
  
  Future<List<Fish>?> getOneFish(id) async {
    final uri = Uri.parse(apiLink + id.toString());
    var response = await client.get(uri);

    if(response.statusCode == 200){
      var json = response.body;
      return fishFromJson(json);
    }
    return null;
  }

  Future<List<Fish>?> searchFish(input) async {
    final uri = Uri.parse('${apiLink}search/$input');
    var response = await client.get(uri);

    if(response.statusCode == 200) {
      var json = response.body;
      return fishFromJson(json);
    }
    return null;
  }
}