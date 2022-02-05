import 'package:flutter/material.dart';

class Resultado extends StatefulWidget {
  //const Resultado({Key? key}) : super(key: key);
  String? cep;
  String? logradouro;
  String? bairro;
  String? complemento;
  String? localidade;
  String? uf;

  Resultado(
      {Key? key,
      this.cep,
      this.logradouro,
      this.complemento,
      this.bairro,
      this.localidade,
      this.uf})
      : super(key: key);

  @override
  _ResultadoState createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultado da Busca"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: Text(
              "Cep: ${widget.cep} \nLogradouro: ${widget.logradouro} \nComplemento: ${widget.complemento} \nBairro: ${widget.bairro} \nLocalidade: ${widget.localidade} \nUF: ${widget.uf}",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
