import 'package:flutter/material.dart';

import 'tela_catalogo.dart';

void main() => runApp(const LojaApp());

class LojaApp extends StatelessWidget {
  const LojaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catálogo de Produtos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
      home: const TelaCatalogo(),
    );
  }
}
