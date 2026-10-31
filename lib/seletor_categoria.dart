import 'package:flutter/material.dart';

import 'categoria.dart';

class SeletorCategoria extends StatelessWidget {
  final Categoria valor;
  final ValueChanged<Categoria> aoAlterar;

  const SeletorCategoria({
    super.key,
    required this.valor,
    required this.aoAlterar,
  });

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: const InputDecoration(
        labelText: 'Categoria',
        border: OutlineInputBorder(),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Categoria>(
          value: valor,
          isExpanded: true,
          items: Categoria.values
              .map(
                (c) => DropdownMenuItem(
                  value: c,
                  child: Row(
                    children: [
                      Icon(c.icone, size: 20),
                      const SizedBox(width: 10),
                      Text(c.nome),
                    ],
                  ),
                ),
              )
              .toList(),
          onChanged: (c) {
            if (c != null) aoAlterar(c);
          },
        ),
      ),
    );
  }
}
