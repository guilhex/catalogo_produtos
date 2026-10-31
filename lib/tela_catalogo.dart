import 'package:flutter/material.dart';

import 'categoria.dart';
import 'produto.dart';
import 'cartao_produto.dart';
import 'tela_cadastro.dart';

class TelaCatalogo extends StatefulWidget {
  const TelaCatalogo({super.key});

  @override
  State<TelaCatalogo> createState() => _TelaCatalogoState();
}

class _TelaCatalogoState extends State<TelaCatalogo> {
  final _buscaCtrl = TextEditingController();
  String _busca = '';

  final List<Produto> _catalogo = [
    const Produto(nome: 'Fone Bluetooth', preco: 199.90, categoria: Categoria.tecnologia),
    const Produto(nome: 'Poltrona', preco: 850.00, categoria: Categoria.casa),
    const Produto(nome: 'Jaqueta Jeans', preco: 229.50, categoria: Categoria.moda),
  ];

  List<Produto> get _produtosFiltrados {
    final termo = _busca.trim().toLowerCase();
    if (termo.isEmpty) return _catalogo;

    return _catalogo.where((produto) {
      return produto.nome.toLowerCase().contains(termo) ||
          produto.categoria.nome.toLowerCase().contains(termo);
    }).toList();
  }

  @override
  void dispose() {
    _buscaCtrl.dispose();
    super.dispose();
  }

  Future<void> _abrirCadastro() async {
    final novo = await Navigator.of(context).push<Produto>(
      MaterialPageRoute(builder: (_) => const TelaCadastro()),
    );

    if (novo != null) {
      setState(() => _catalogo.add(novo));
    }
  }

  void _colocarNoCarrinho(Produto produto) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        content: Text('${produto.nome} foi adicionado ao carrinho'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Produtos'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
            child: TextField(
              controller: _buscaCtrl,
              onChanged: (valor) => setState(() => _busca = valor),
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                labelText: 'Buscar produtos',
                hintText: 'Nome ou categoria',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _busca.isEmpty
                    ? null
                    : IconButton(
                        tooltip: 'Limpar busca',
                        onPressed: () {
                          _buscaCtrl.clear();
                          setState(() => _busca = '');
                        },
                        icon: const Icon(Icons.clear),
                      ),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: _catalogo.isEmpty
                ? const Center(child: Text('Nenhum produto cadastrado'))
                : _produtosFiltrados.isEmpty
                    ? const Center(child: Text('Nenhum produto encontrado'))
                    : ListView.builder(
                        padding: const EdgeInsets.fromLTRB(12, 8, 12, 88),
                        itemCount: _produtosFiltrados.length,
                        itemBuilder: (context, i) {
                          final produto = _produtosFiltrados[i];
                          return CartaoProduto(
                            produto: produto,
                            aoSelecionar: () => _colocarNoCarrinho(produto),
                          );
                        },
                      ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _abrirCadastro,
        icon: const Icon(Icons.add),
        label: const Text('Novo produto'),
      ),
    );
  }
}
