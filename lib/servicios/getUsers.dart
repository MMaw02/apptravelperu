import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apptravelperu/model/model_usuario.dart';
import 'package:flutter/material.dart';

class getUser {
  static final _client = http.Client();

  static final _loginUrl =
      Uri.parse('https://user-dot-apptravelperu-v2.uc.r.appspot.com/user');

  static login(usuario, password, context) async {
    http.Response response = await _client.get(
      _loginUrl,
    );

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      for (var element in json['entity']) {
        Usuarios user = Usuarios(element['usuario'], element['password']);
        if (user.usuario == usuario && user.password == password) {
          // String nombreUsuario = usuario.toString();
          await Navigator.pushNamed(context, '/');
        } else {
          // ScaffoldMessenger.of(context)
          //     .showSnackBar(SnackBar(content: Text('INGRESO FALLIDO')));
        }
      }
    }
  }
}
