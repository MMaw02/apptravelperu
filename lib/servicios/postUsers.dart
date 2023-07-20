import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class postUser {
  static final _client = http.Client();
  static final urlRegister =
      Uri.parse('https://user-dot-apptravelperu-v2.uc.r.appspot.com/user');

  static register(String usuario, String dni, String email, String password,
      context) async {
    http.Response response = await _client.post(urlRegister,
        headers: {"content-type": "application/json"},
        body: jsonEncode({
          "usuario": usuario,
          "dni": dni,
          "email": email,
          "password": password
        }));

    var data = json.decode(response.body);
    print(data);
    print(response);

    if (response.statusCode == 200) {

      ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('REGISTRO EXITOSO!')));

      Navigator.pushNamed(context, '/Bienvenida');
    } else {
      // await EasyLoading.showError("Error Code : ${response.statusCode}");
    }
  }
}
