import 'dart:convert';
import 'package:http/http.dart' as http;

class Place {
  final placeId, mainText, secondaryText;

  Place({required this.placeId, this.mainText, this.secondaryText});

  static Place descriptionId(Map<String, dynamic> json) {
    return Place(
      placeId: json['place_id'],
      mainText: json['structured_formatting']['main_text'],
      secondaryText: json['structured_formatting']['secondary_text']
    );
  }
}

class PlaceApi {
  final String key = 'AIzaSyDFfvbwVyhJbk1Sm2lRCBLwNbmFs7Fnubc';

  Future<List<Place>> searchPredictions(String input) async {
    final response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&types=tourist_attraction|park|stadium|museum|point_of_interest&components=country:pe&language=es-Es&key=$key'));

    final json = jsonDecode(response.body);
    List<dynamic> body = json['predictions'];

    final List<Place> places = body.map((e) => Place.descriptionId(e)).toList();

    return places;
  }

  Future<Map<String, dynamic>> getPlaceId(String input) async {
    final inputPlaceId = Place(placeId: input).placeId;

    final response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$inputPlaceId&key=$key'));

    final json = jsonDecode(response.body);
    var results = json['result'] as Map<String, dynamic>;

    return results;
  }
}
