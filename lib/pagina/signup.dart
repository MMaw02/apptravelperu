import 'package:apptravelperu/servicios/postUsers.dart';
import 'package:apptravelperu/widgets/custom_input.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  String usuario = '';
  String dni = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Text('Crear una cuenta', style: TextStyle(
                fontSize: 24, 
                fontWeight: FontWeight.bold, 
                height: 5.0)),
              const Text('¡ Registrate ahora,\n y explora las maravillas del Perú !', style: TextStyle(
                fontSize: 18, 
                fontWeight: FontWeight.w300),
                textAlign: TextAlign.center),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {return print('hola');},
                child: Text('Registrate con Google'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  elevation: 5,
                  minimumSize: const Size(380, 50)
                )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
                child: Center(
                  child: Row(
                    children: const <Widget> [
                      Expanded(
                        child: Divider(
                          color: Colors.black)),
                      Text('   o   '),
                      Expanded(
                        child: Divider(
                          color: Colors.black)),
                    ],
                  )
                )
              ),
              TextFieldWidget(
                hintText: 'Usuario',
                obscureText: false,
                prefixIconData: Icons.person,
                onChanged: (value) {
                  setState(() {
                    usuario = value;
                  });
                },
                keybox: 'Usuario'
              ),
              TextFieldWidget(
                hintText: 'DNI',
                obscureText: false,
                prefixIconData: Icons.badge,
                onChanged: (value) {
                  setState(() {
                    dni = value;
                  });
                },
                keybox: 'DNI'
              ),
              TextFieldWidget(
                hintText: 'Email',
                obscureText: false,
                prefixIconData: Icons.email,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                keybox: 'Email'
              ),
              TextFieldWidget(
                hintText: 'Contraseña',
                obscureText: true,
                prefixIconData: Icons.lock_outline,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                keybox: 'Contraseña'
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  await postUser.register(usuario, dni, email, password, context);
                },
                child: const Text('Registrarse', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  elevation: 5,
                  minimumSize: const Size(380, 50)
                )
              ),
              
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('¿Ya tienes una cuenta?', style: TextStyle(fontSize: 16)),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, '/Login'),
                      child: const Text('Inicia Sesión', style: TextStyle(
                        fontSize: 16, 
                        fontWeight: FontWeight.w500, 
                        color: Colors.red))
                    )
                  ]
                )
              )
            ],
          )
        ),
      )
    );
  }
}