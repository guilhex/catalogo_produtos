import 'package:flutter/material.dart';

import 'produto.dart';

class CartaoProduto extends StatelessWidget {
  final Produto produto;
  final VoidCallback aoSelecionar;

  const CartaoProduto({
    super.key,
    required this.produto,
    required this.aoSelecionar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: aoSelecionar,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: Colors.teal.shade50,
                child: Icon(produto.categoria.icone, color: Colors.teal),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      produto.nome,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(produto.precoFormatado,
                        style: const TextStyle(fontSize: 15)),
                    Text(
                      produto.categoria.nome,
                      style: const TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              FilledButton(
                onPressed: aoSelecionar,
                child: const Text('Comprar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
