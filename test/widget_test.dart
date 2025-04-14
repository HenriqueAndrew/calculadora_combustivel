import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/calcula_combustivel_controller.dart';
import 'package:myapp/pages/calcula_combustivel_page.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Testar a lógica da aplicação calcula combustível', (WidgetTester tester) async { 
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => CalculaCombustivelController(),
        child: const MaterialApp(
          home: CalculaCombustivelPage(),
        ),
      ),
    );

    // Confirma que a página abriu e existe o botão Calcular
    expect(find.text('Calcular'), findsOneWidget);

    // Simula toque no botão sem preencher campos
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump(); // Espera o SnackBar aparecer

    // Valida que apareceu o aviso de erro
    expect(find.text('Preencha ambos os campos corretamente!'), findsOneWidget);

    // Preenche os TextFields com valores válidos
    await tester.enterText(find.byType(TextField).at(0), "4.55");
    await tester.enterText(find.byType(TextField).at(1), "3.19");

    // Toca no botão de calcular
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle(); // Espera todas animações concluírem

    // Valida que o resultado apareceu (controlado pelo Consumer)
    expect(find.byType(Text), findsWidgets); // Deve ter o texto do resultado
    expect(find.textContaining('Etanol'), findsOneWidget); // O resultado esperado
  });
}