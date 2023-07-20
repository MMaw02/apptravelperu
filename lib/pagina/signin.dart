import 'package:apptravelperu/servicios/getUsers.dart';
import 'package:apptravelperu/widgets/custom_input.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  String usuario = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
      child: Column(
        children: [
          const Text('Iniciar Sesión',
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, height: 5.0)),
          const Text('¡ Bienvenido ! \n Por favor ingrese sus datos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
              textAlign: TextAlign.center),
          const SizedBox(height: 30),
          ElevatedButton(
              onPressed: () {
                return print('hola');
              },
              child: Text('Registrate con Google'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  elevation: 5,
                  minimumSize: const Size(380, 50))),
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
              child: Center(
                  child: Row(
                children: const <Widget>[
                  Expanded(child: Divider(color: Colors.black)),
                  Text(' o ', style: TextStyle(letterSpacing: 20)),
                  Expanded(child: Divider(color: Colors.black)),
                ],
              ))),
          TextFieldWidget(
            hintText: 'Usuario',
            obscureText: false,
            prefixIconData: Icons.person,
            onChanged: (value) {
              setState(() {
                usuario = value;
              });
            },
            keybox: 'Usuario',
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
          const SizedBox(height: 30),
          ElevatedButton(
              onPressed: () async {
                await getUser.login(usuario, password, context);
              },
              child: Text('Iniciar Sesion', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  elevation: 5,
                  minimumSize: const Size(380, 50))),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text('¿No tienes una cuenta?',
                    style: TextStyle(fontSize: 16)),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                    onTap: () => Navigator.pushNamed(context, '/Register'),
                    child: const Text('Registrate',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.red)))
              ]))
        ],
      ),
    )));
  }
}
