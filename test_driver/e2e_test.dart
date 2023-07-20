import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Registro InicioSesion y Busqueda Lugar', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      driver = await FlutterDriver.connect();
      if (driver != null) {
        driver.close();
      }
    });

    // Registro y Login
    final registerPageButton = find.text('RECORRE EL PERÚ CON NOSOTROS');
    final loginPageButton = find.text('Iniciar Sesion');

    final registroButton = find.text('Registrarse');
    final loginButton = find.text('Iniciar Sesion');

    final usuarioBox = find.byValueKey('Usuario');
    final dniBox = find.byValueKey('DNI');
    final emailBox = find.byValueKey('Email');
    final passwordBox = find.byValueKey('Contraseña');

    final searchPlaceBox = find.byValueKey('SearchPlace');

    test('Registro y InicioSesion', () async {
      driver = await FlutterDriver.connect();

      // Página Registro
      await driver.waitFor(registerPageButton);
      await Future.delayed(Duration(seconds: 3));
      await driver.tap(registerPageButton);

      // Formulario Regsitro
      await driver.waitFor(usuarioBox);
      await driver.tap(usuarioBox);
      await driver.enterText('PruebasAA4');

      await driver.waitFor(dniBox);
      await driver.tap(dniBox);
      await driver.enterText('10101010');

      await driver.waitFor(emailBox);
      await driver.tap(emailBox);
      await driver.enterText('PruebasAA4@email.com');

      await driver.waitFor(passwordBox);
      await driver.tap(passwordBox);
      await driver.enterText('123456');

      await driver.waitFor(registroButton);
      await driver.tap(registroButton);

      // Página Login
      await driver.waitFor(loginPageButton);
      await Future.delayed(Duration(seconds: 3));
      await driver.tap(loginPageButton);

      // Formulario Login
      await driver.waitFor(usuarioBox);
      await driver.tap(usuarioBox);
      await driver.enterText('PruebasAA4');

      await driver.waitFor(passwordBox);
      await driver.tap(passwordBox);
      await driver.enterText('123456');

      await driver.waitFor(loginButton);
      await driver.tap(loginButton);
      await Future.delayed(Duration(seconds: 3));

      //Pagina de Inicio - Buscar Lugar
      await driver.waitFor(searchPlaceBox);
      await driver.tap(searchPlaceBox);
      await Future.delayed(Duration(seconds: 3));
      await driver.enterText('Plaza de Armas');
      await Future.delayed(Duration(seconds: 5));
      await driver.waitFor(find.text('Plaza de Armas de Lima'));
      await driver.tap(find.text('Plaza de Armas de Lima'));
    });
  });
}
