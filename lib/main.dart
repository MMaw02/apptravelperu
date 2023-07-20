import 'package:apptravelperu/Widgets/navegation.dart';
import 'package:apptravelperu/pagina/inicio.dart';
import 'package:flutter/material.dart';
import 'package:apptravelperu/pagina/onboard.dart';
import 'package:apptravelperu/pagina/signin.dart';
import 'package:apptravelperu/pagina/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Travel Perú',
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => const navegationBarTravel(),
        '/Bienvenida' :(context) => const InicialPage(),
        '/Register' :(context) => const SignUpPage(),
        '/Login' :(context) => const SignInPage(),
        '/Inicio' :(context) => const InicioPage()
      },
      initialRoute: '/Bienvenida'
    );
  }
}