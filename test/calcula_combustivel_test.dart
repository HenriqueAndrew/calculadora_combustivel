import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/calcula_combustivel_controller.dart';

void main (){
    late CalculaCombustivelController controller;

    setUp((){
        controller = CalculaCombustivelController();
    });

    group("Testes de cálculo de combustível", (){      
      test("valor inicial deve ser nulo ou vazio", () {
        expect(controller.resultado, isNull);
      });

      test("Teste no limite de 70%. Gasolina mais barato que Etanol", () {
        controller.calculaCombustivel(gasolina: 5.0, etanol: 3.8);      
        expect(controller.resultado, "Abasteça com Gasolina");
      });      

      test('Teste no limite de 70%. Etanol mais barato que a Gasolina', () {
      controller.calculaCombustivel(gasolina: 5.0, etanol: 3.5);
      expect(controller.resultado, 'Abasteça com Etanol');
      });

    test('Teste com valores inválidos (zero)', () {
      expect(
        () => controller.calculaCombustivel(gasolina: 0, etanol: 0),
        throwsA(isA<ArgumentError>()),
      );
    });

  });

}