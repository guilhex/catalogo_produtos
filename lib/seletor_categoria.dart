import 'package:flutter/material.dart';

import 'categoria.dart';

class SeletorCategoria extends StatelessWidget {
  final Categoria? valor;
  final ValueChanged<Categoria> aoAlterar;

  const SeletorCategoria({
    super.key,
    required this.valor,
    required this.aoAlterar,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<Categoria>(
      initialValue: valor,
      validator: (value) => value == null ? 'Selecione uma categoria' : null,
      builder: (state) {
        return InputDecorator(
          decoration: InputDecoration(
            labelText: 'Categoria',
            border: const OutlineInputBorder(),
            errorText: state.errorText,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<Categoria>(
              value: state.value,
              hint: const Text('Selecione uma categoria'),
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
                if (c != null) {
                  state.didChange(c);
                  aoAlterar(c);
                }
              },
            ),
          ),
        );
      },
    );
  }
}
