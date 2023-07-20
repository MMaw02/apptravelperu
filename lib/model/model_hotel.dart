class Hotels {
  String hotel = '';
  String direccion = '';
  String provincia = '';
  String region = '';
  String precio = '';
  String descripcion = '';
  String contacto = '';
  String rating = '';
  String estrella = '';
  String horario_entrada = '';
  String horario_salida = '';
  String imagen = '';

  Hotels(
      {required this.hotel,
      required this.direccion,
      required this.region,
      required this.provincia,
      required this.precio,
      required this.contacto,
      required this.descripcion,
      required this.rating,
      required this.estrella,
      required this.horario_entrada,
      required this.horario_salida,
      required this.imagen,
      });

  factory Hotels.fromJson(Map<String, dynamic> json) {
    return Hotels(
        hotel: json['hotel'],
        direccion: json['direccion'],
        region: json['region'],
        provincia: json['provincia'],
        precio: json['precio'],
        descripcion: json['descripcion'],
        contacto: json['contacto'],
        rating: json['rating'],
        estrella: json['estrella'],
        horario_entrada: json['horario_entrada'],
        horario_salida: json['horario_salida'],
        imagen: json['imagen'],
        );
  }
}
