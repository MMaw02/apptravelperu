import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:apptravelperu/model/model_travel.dart';

class getLugares {
  
  Future<List<Lugares>> getListPlaces() async {
    final response = await http.get(Uri.parse(
        'https://place-dot-apptravelperu-v2.uc.r.appspot.com/place'));

    if (response.statusCode == 200) {

      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['entity'];

      List<Lugares> lugares = body.map((dynamic item) => Lugares.fromJson(item)).toList();

      return (lugares);
    } else {
      throw Exception("Fallo la conexión");
    }
  }
}