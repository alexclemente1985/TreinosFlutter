import 'dart:math';

import 'package:flutter/material.dart';

class FrasesDia extends StatefulWidget {
  @override
  FrasesDiaState createState() => FrasesDiaState();
}

class FrasesDiaState extends State<FrasesDia>{
  var _frases = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam interdum eu justo sit amet laoreet.",
    "Morbi vel porttitor dui.",
    "Nunc nunc sapien, bibendum at suscipit vehicula, elementum quis metus.",
    "Vivamus est risus, vulputate et ex id, fringilla sagittis nisi.",
    "Maecenas sapien tortor, dictum venenatis interdum non, suscipit a sapien.",
    "Proin non massa vel libero eleifend venenatis eu finibus odio.",
    "Suspendisse potenti.",
    "Nunc sit amet urna at nisl lobortis lacinia vel ac diam."
  ];
  
  //var _frase = _frases[Random().nextInt(_frases.length)];
  var _frase = "Clique abaixo e veja uma frase do dia!";

  void _gerarFrase(){
    var numSorteado = Random().nextInt(_frases.length);

    if (_frase != _frases[numSorteado]){
      _frase = _frases[numSorteado];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do Dia",
        style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity, //define a largura como toda a que estiver disponível
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "images/mesa.jpg",
              fit: BoxFit.fitWidth,
            ),
            Text(_frase),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
              onPressed: (){
                setState(() {
                  _gerarFrase();
                });
              }, 
              child: Text(
                "Clique para gerar uma nova frase!",
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 17,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,)
            )
          ],
        ),
      ),
    );
  }
}