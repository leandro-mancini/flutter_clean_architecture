import 'package:aprove_me/src/app/pages/detalhes_registro/detalhes_registro_view.dart';
import 'package:aprove_me/src/app/pages/home/home_view.dart';
import 'package:aprove_me/src/app/pages/login/login_view.dart';
import 'package:aprove_me/src/app/pages/registros_pendentes/registros_pendentes_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aprove-me',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        CustomLocalizationDelegate(),
      ],  
      theme: ThemeData(
        primaryColor: Color(0xFFFF6759),
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/Home': (context) => HomePage(),
        // '/RegistrosPendentes': (context) => RegistrosPendentes(),
        // '/DetalhesRegistro': (context) => DetalhesRegistro()
      }
    );
  }
}
