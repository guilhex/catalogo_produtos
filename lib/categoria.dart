import 'package:flutter/material.dart';

enum Categoria {
  tecnologia('Tecnologia', Icons.memory),
  casa('Casa', Icons.chair),
  moda('Moda', Icons.checkroom),
  mercado('Mercado', Icons.shopping_basket),
  lazer('Lazer', Icons.sports_esports);

  final String nome;
  final IconData icone;

  const Categoria(this.nome, this.icone);
}
