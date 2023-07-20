import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:apptravelperu/model/model_noticias.dart';


Future<List<Noticias>> getListNews() async {
  final response = await http.get(Uri.parse(
      'https://news-dot-apptravelperu-v2.uc.r.appspot.com/news'));

  List<Noticias> news = [];

  if (response.statusCode == 200) {
    //permite codificar correctamente en UTF8, EJEMPLO dieresis, tildes.
    String body = utf8.decode(response.bodyBytes);

    final jsonData = json.decode(body);

    for (var item in jsonData['entity']) {
      String titulo = "";
      String descripcion = "";
      String imagen = "";
      String fuente = "";

      if (item["titulo"] != null) {
        titulo = item["titulo"];
      }
      if (item["descripcion"] != null) {
        descripcion = item["descripcion"];
      }
      if (item["imagen"] != null) {
        imagen = item["imagen"];
      }
      if (item["fuente"] != null) {
        fuente = item["fuente"];
      }
      news.add(Noticias(titulo, descripcion, imagen, fuente));
    }
    return (news);
  } else {
    throw Exception("Fallo la conexión");
  }
}