import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_catalogo_produtos/main.dart';

void main() {
  testWidgets('valida o cadastro e adiciona o produto ao catálogo', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(800, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(const LojaApp());

    expect(find.text('Fone Bluetooth'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Confirmar cadastro'));
    await tester.pump();
    expect(find.text('Informe o nome'), findsOneWidget);
    expect(find.text('Informe um preço válido'), findsOneWidget);
    expect(find.text('Selecione uma categoria'), findsNWidgets(2));

    await tester.enterText(find.byType(TextFormField).at(0), 'Teclado');
    await tester.enterText(find.byType(TextFormField).at(1), '150,50');
    final dropdown = find.byWidgetPredicate(
      (widget) => widget is DropdownButton,
    );
    await tester.ensureVisible(dropdown);
    await tester.tap(dropdown);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Tecnologia').last);
    final confirmar = find.widgetWithText(FilledButton, 'Confirmar cadastro');
    await tester.drag(find.byType(Scrollable).last, const Offset(0, -160));
    await tester.pump();
    await tester.tap(confirmar);
    await tester.pumpAndSettle();

    expect(find.text('Teclado'), findsOneWidget);
    expect(find.text('Fone Bluetooth'), findsOneWidget);
  });

  testWidgets('mostra mensagem ao selecionar um produto', (tester) async {
    await tester.pumpWidget(const LojaApp());

    await tester.tap(find.text('Fone Bluetooth'));
    await tester.pump();

    expect(
      find.text('Fone Bluetooth foi adicionado ao carrinho'),
      findsOneWidget,
    );
  });
}
