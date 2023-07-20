import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:apptravelperu/model/model_hotel.dart';

class getHoteles {
  
  Future<List<Hotels>> getListHotels() async {
    final response = await http.get(Uri.parse(
        'https://hotel-dot-apptravelperu-v2.uc.r.appspot.com/hotel'));

    if (response.statusCode == 200) {

      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['entity'];

      List<Hotels> hoteles = body.map((dynamic item) => Hotels.fromJson(item)).toList();

      return (hoteles);
    } else {
      throw Exception("Fallo la conexión");
    }
  }
}