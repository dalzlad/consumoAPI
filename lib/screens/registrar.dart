import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class Http{
  static String url = "http://diegolopezsena-001-site1.ctempurl.com/api/oferta";
  static postUsuario(Map oferta) async{
    try {
      final res = await http.post(Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(oferta),
     
      );
      if(res.statusCode == 200){//Si la respuesta es 200 la inserción es exitosa
        var data = jsonDecode(res.body.toString());
        print(data);
      }
      else{
        print(res.statusCode);
      }
    } catch(e){
     print(e.toString());
    }
  }
}

class Registrar extends StatefulWidget {
  const Registrar({super.key});

  @override
  State<Registrar> createState() => _RegistrarState();
}

TextEditingController nombre = TextEditingController();
TextEditingController precio = TextEditingController();
TextEditingController tipoOfertaId = TextEditingController();


class _RegistrarState extends State<Registrar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar oferta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            TextField(
              controller: nombre,
              decoration: const InputDecoration(hintText: "Nombre"),
        
            ),
            const SizedBox(height: 20,),
            TextField(              
              controller: precio,
              decoration: const InputDecoration(hintText: "Precio"),
              ),
            const SizedBox(height: 20,),
              TextField(              
              controller: tipoOfertaId,
              decoration: const InputDecoration(hintText: "Tipo Oferta"),
              ),
            const SizedBox(height: 20,),
             ElevatedButton.icon(onPressed:(){
            var oferta ={
              "nombre":nombre.text,
              "precio" : precio.text,
              "tipoOfertaId" : tipoOfertaId.text
            };
          
            print(oferta);
            Http.postUsuario(oferta);
          },
          icon: const Icon(Icons.new_label),
          label: const Text("Registrar")

             )

          ]),
        ),
      );
  }
}