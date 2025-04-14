import 'package:flutter/material.dart';
import 'package:myapp/calcula_combustivel_controller.dart';
import 'package:provider/provider.dart';

class CalculaCombustivelPage extends StatelessWidget {
  const CalculaCombustivelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gasolinaController = TextEditingController();
    final etanolController = TextEditingController();
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Cálculo de Combustível'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: gasolinaController,
              decoration: InputDecoration(
                labelText: 'Preço da Gasolina',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 16),
            TextField(
              controller: etanolController,
              decoration: InputDecoration(
                labelText: 'Preço do Etanol',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                final gasolina = double.tryParse(gasolinaController.text);
                final etanol = double.tryParse(etanolController.text);

                if (gasolina == null || etanol == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Preencha ambos os campos corretamente!')),
                  );
                  return;
                }

                try {
                  context.read<CalculaCombustivelController>().calculaCombustivel(
                        gasolina: gasolina,
                        etanol: etanol,
                      );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Erro: ${e.toString()}')),
                  );
                }
              },
              child: Text('Calcular'),
            ),
            SizedBox(height: 24),
            Consumer<CalculaCombustivelController>(
              builder: (context, controller, child) {
                if (controller.resultado == null) {
                  return SizedBox.shrink(); // não mostra nada
                }
                return Text(
                  controller.resultado!,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                  textAlign: TextAlign.center,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}