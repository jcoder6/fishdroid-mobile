import 'package:fishdroid/data/fishes.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Fish>?> getFishes() async {

    var client = http.Client();

    var uri = Uri.parse('http://localhost:8000/api/fishes/');
    var response = await client.get(uri);

    if(response.statusCode == 200){
      var json = response.body;
      return fishFromJson(json);
    }
    return null;

  }
}