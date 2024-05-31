import 'package:flutter/material.dart';
import 'package:get_api_0/screens/listardepartamentos.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ListarDepartamentos(),
    
    );
  }
}
