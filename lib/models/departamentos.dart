//import 'dart:convert';
import 'dart:convert';
import 'package:http/http.dart' as http;

 class Departamento {
  final String codigo_departamento;
  final String nombre_departamento;

  Departamento(
    {required this.codigo_departamento, required this.nombre_departamento});

  factory Departamento.fromJson(Map<String, dynamic> json) {
    return Departamento(
      codigo_departamento: json['codigo_departamento'],
      nombre_departamento: json['nombre_departamento'],
    );
  }
  //Incorporar Future para traer los datos del api
 }