import 'package:flutter/material.dart';

import 'categoria.dart';
import 'produto.dart';
import 'seletor_categoria.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final _formKey = GlobalKey<FormState>();
  final _nomeCtrl = TextEditingController();
  final _precoCtrl = TextEditingController();
  Categoria _categoria = Categoria.tecnologia;

  @override
  void dispose() {
    _nomeCtrl.dispose();
    _precoCtrl.dispose();
    super.dispose();
  }

  double? _lerPreco(String? texto) =>
      double.tryParse((texto ?? '').trim().replaceAll(',', '.'));

  void _confirmar() {
    if (!_formKey.currentState!.validate()) return;

    final produto = Produto(
      nome: _nomeCtrl.text.trim(),
      preco: _lerPreco(_precoCtrl.text)!,
      categoria: _categoria,
    );

    Navigator.of(context).pop(produto);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Produto'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(
              controller: _nomeCtrl,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                labelText: 'Nome do produto',
                border: OutlineInputBorder(),
              ),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Informe o nome' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _precoCtrl,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Preço',
                prefixText: 'R\$ ',
                border: OutlineInputBorder(),
              ),
              validator: (v) {
                final valor = _lerPreco(v);
                return (valor == null || valor <= 0)
                    ? 'Informe um preço válido'
                    : null;
              },
            ),
            const SizedBox(height: 16),
            SeletorCategoria(
              valor: _categoria,
              aoAlterar: (c) => setState(() => _categoria = c),
            ),
            const SizedBox(height: 28),
            FilledButton.icon(
              onPressed: _confirmar,
              icon: const Icon(Icons.check),
              label: const Text('Confirmar cadastro'),
            ),
          ],
        ),
      ),
    );
  }
}
