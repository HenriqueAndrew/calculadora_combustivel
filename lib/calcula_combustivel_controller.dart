import 'package:flutter/material.dart';

class CalculaCombustivelController extends ChangeNotifier {
  String? _resultado;

  String? get resultado => _resultado;

  void calculaCombustivel({required double gasolina, required double etanol}) {
    if (gasolina <= 0 || etanol <= 0) {
      throw ArgumentError('Os valores devem ser maiores que zero.');
    }

    double proporcao = etanol / gasolina;

    if (proporcao <= 0.7) {
      _resultado = 'Abasteça com Etanol';
    } else {
      _resultado = 'Abasteça com Gasolina';
    }

    notifyListeners();
  }

  void limparResultado() {
    _resultado = null;
    notifyListeners();
  }
}
