import 'package:flutter/material.dart';
import 'package:myapp/pages/calcula_combustivel_page.dart';
import 'package:provider/provider.dart';
import 'calcula_combustivel_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CalculaCombustivelController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CalculaCombustivelPage(),
      ),
    ),
  );
}
