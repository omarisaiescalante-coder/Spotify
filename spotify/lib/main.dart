import 'package:flutter/material.dart';

import 'screens/Pantalla_Inicio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navegacion Flutter',
      home: const PantallaInicio(),
    );
  }
}
