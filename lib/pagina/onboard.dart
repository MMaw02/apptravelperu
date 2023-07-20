import 'package:flutter/material.dart';

class InicialPage extends StatelessWidget {
  const InicialPage({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: NetworkImage('https://storage.googleapis.com/bucket-apptravelperu/images/others/vinicunca.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken))
        ),
        child: Center( 
          child: Column(
            children: <Widget>[
              const Text('APP TRAVEL PERÚ', style: TextStyle(
                color: Colors.yellow,
                fontSize: 36,
                fontWeight: FontWeight.bold,
                height: 8)),
              const Text('¡ Yo no pedí nacer\n en PERÚ,\n simplemente Dios\n me bendijo !', style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.normal,
                letterSpacing: 3),
                textAlign: TextAlign.center),
              const SizedBox(height: 50),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/Register'),
                child: Text('RECORRE EL PERÚ CON NOSOTROS', style: TextStyle(
                  color: Colors.white,
                  fontSize: 20)),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  minimumSize: Size(380.0, 60.0),
                  elevation: 25.0,)
              ),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/Login'),
                child: Text('Iniciar Sesion', style: TextStyle(
                  color: Colors.black,
                  fontSize: 18)),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: const Size(180.0, 40.0),
                  elevation: 25.0,)
              ),
            ]
          )
        )
      )
    );
  }
}
