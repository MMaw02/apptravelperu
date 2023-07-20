class Lugares {
  String lugar = '';
  String informacion = '';
  String direccion = '';
  String provincia = '';
  String region = '';
  String rating = '';
  String imagen = '';
  String? latitud = '';
  String? longitud = '';

  Lugares(
      {required this.lugar,
      required this.informacion,
      required this.direccion,
      required this.provincia,
      required this.region,
      required this.rating,
      required this.imagen,
      this.latitud,
      this.longitud});

  factory Lugares.fromJson(Map<String, dynamic> json) {
    return Lugares(
        lugar: json['lugar'],
        informacion: json['informacion'],
        direccion: json['direccion'],
        provincia: json['provincia'],
        region: json['region'],
        rating: json['rating'],
        imagen: json['imagen'],
        latitud: json['latitud'],
        longitud: json['longitud'],
        );
  }
}
