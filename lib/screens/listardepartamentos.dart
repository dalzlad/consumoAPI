//https://www.datos.gov.co/resource/vcjz-niiq.json

import 'package:flutter/material.dart';
import 'package:get_api_0/models/departamentos.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ListarDepartamentos extends StatefulWidget {
  const ListarDepartamentos({super.key});

  @override
  State<ListarDepartamentos> createState() => _ListarDepartamentosState();
}

Future<List<Departamento>> fetchDepartamentos() async {
    final response = await http
        .get(Uri.parse('https://www.datos.gov.co/resource/vcjz-niiq.json'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((departamento) => Departamento.fromJson(departamento))
          .toList();
    } else {
      throw Exception('Falló en la carga de la API');
    }
  }

class _ListarDepartamentosState extends State<ListarDepartamentos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Departamentos')
      ),
      body:FutureBuilder<List<Departamento>>(
        future: fetchDepartamentos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No users found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var departamento = snapshot.data![index];
                return ListTile(
                  title: Text(departamento.codigo_departamento),
                  subtitle: Text(departamento.nombre_departamento),
                );
              },
            );
          }
        },
      ),
    );
  }
}