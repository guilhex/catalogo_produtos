# Catálogo de Produtos

Aplicativo Flutter para visualizar produtos, cadastrar novos itens e simular a
adição de produtos ao carrinho.

## Funcionalidades

- Lista de produtos usando `List<Produto>` e `ListView.builder`.
- Cadastro de produto com nome, preço e categoria.
- Ícone definido automaticamente de acordo com a categoria.
- Busca por nome ou categoria.
- Inclusão de novos produtos sem substituir os existentes.
- Mensagem `SnackBar` ao selecionar um produto ou tocar em **Comprar**.
- Validação dos campos obrigatórios e do preço informado.

## Requisitos

- Flutter instalado e disponível no `PATH`.
- Chrome para executar a versão web, ou um emulador/dispositivo configurado.

Confira o ambiente com:

```bash
flutter doctor
```

## Como executar

```bash
git clone URL_DO_REPOSITORIO
cd flutter_catalogo_produtos
flutter pub get
flutter run -d chrome
```

Para executar em um dispositivo específico, liste os dispositivos disponíveis:

```bash
flutter devices
flutter run -d ID_DO_DISPOSITIVO
```

## Estrutura do projeto

```text
lib/
├── main.dart                 # Entrada do aplicativo
├── categoria.dart            # Categorias e seus ícones
├── produto.dart              # Modelo de produto
├── cartao_produto.dart       # Card de cada produto
├── seletor_categoria.dart    # Dropdown de categorias
├── tela_catalogo.dart        # Tela principal e busca
└── tela_cadastro.dart        # Formulário de cadastro
```

## Boas práticas utilizadas

- `TextEditingController` é liberado no método `dispose`.
- O modelo `Produto` é imutável, com campos `final` e construtor `const`.
- A lógica de filtragem fica separada na propriedade `_produtosFiltrados`.
- A lista original não é alterada durante a busca.
- Campos do formulário possuem validação antes do cadastro.
- O código usa `const` sempre que o widget pode ser criado em tempo de
  compilação.

## Publicação no GitHub

```bash
git init
git add .
git commit -m "Implementa catálogo de produtos"
git branch -M main
git remote add origin URL_DO_REPOSITORIO
git push -u origin main
```
