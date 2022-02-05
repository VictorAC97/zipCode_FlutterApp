import 'package:consumo_servicos/Resultado.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController cepControler = TextEditingController();
  String cep = "";

  _recuperarCep(String cep) async {
    Uri url = Uri.parse("https://viacep.com.br/ws/${cep}/json/");
    http.Response response;

    response = await http.get(url);
    Map<String, dynamic> retorno = json.decode(response.body);
    String? logradouro = retorno["logradouro"];
    String? complemento = retorno["complemento"];
    String? bairro = retorno["bairro"];
    String? localidade = retorno["localidade"];
    String? uf = retorno["uf"];

    print(
        "Resposta: logradouro: ${logradouro} | complemento: ${complemento} | bairro: ${bairro} | localidade: ${localidade} | UF: ${uf}");
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Resultado(
                  cep: cep,
                  logradouro: logradouro,
                  complemento: complemento,
                  bairro: bairro,
                  localidade: localidade,
                  uf: uf,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Consumo de Serviço Web [CEP]',
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            TextField(
              controller: cepControler,
              maxLength: 8,
              maxLengthEnforcement: MaxLengthEnforcement.none,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(label: Text('CEP')),
              onChanged: (String? newValue) {
                cep = newValue!;
              },
            ),
            ElevatedButton(
              onPressed: () {
                _recuperarCep(cep);
              },
              child: Text('Buscar'),
            ),
          ],
        ),
      ),
    );
  }
}
