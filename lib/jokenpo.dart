import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GameOption{
  String type;
  String img;

  GameOption({required this.type, required this.img}); //contructor

  String get getImg {
    return img;
  }
  String get getType {
    return type;
  }
}


class Jokenpo extends StatefulWidget {
  @override
  JokenpoState createState() => JokenpoState();
}

class JokenpoState extends State<Jokenpo>{
  var _appChoice = "padrao";
  var _appPoints = 0;
  var _playerPoints = 0;
  var _matchResult = "Resultado";
  var _round = 1;

  var gameOptions = <GameOption>[
    new GameOption(type: "papel", img: "images/papel.png"),
    new GameOption(type: "pedra", img: "images/pedra.png"),
    new GameOption(type: "tesoura", img: "images/tesoura.png"),
    new GameOption(type: "padrao",img: "images/padrao.png"),
  ];


  matchWinnerHandler({required appChoice, required String playerChoice}){
    
    if(appChoice == playerChoice){
      setState(() {
         this._matchResult = "Deu empate!";
         this._round+=1;
         this._appChoice = appChoice;
      });
     
    }
    else{
      var checker =  '$playerChoice-$appChoice';
      switch (checker){
        case "papel-tesoura":
        case "tesoura-pedra":
        case "pedra-papel":
         
         setState(() {
           this._appChoice = appChoice;
           //this._appImage = AssetImage("$chooseImg('$appChoice')");
           this._appPoints+=1;
           this._matchResult = "Você perdeu...";
           this._round+=1;
         });
         
         break;
        default:
          setState(() {
            //this._appImage = AssetImage("$chooseImg('$appChoice')");
            this._appChoice = appChoice;
            this._matchResult = "Você ganhou!!!";
            this._playerPoints+=1;
            this._round+=1;
          });
          
          break;
      }
    }
    
  }

  String chooseImg(String type){
    var option = gameOptions.where((go) => go.type == type);
    return option.first.getImg;
  }

  appChoiceHandler({String choice = ''}){
    var optionsList = ['papel','pedra','tesoura'];

    var appChoice = optionsList[Random().nextInt(optionsList.length)];

    matchWinnerHandler(appChoice: appChoice, playerChoice: choice);
   }

  resetMatch(){
      setState(() {
        this._appChoice = "padrao";
        this._appPoints = 0;
        this._playerPoints=0;
        this._matchResult = "Resultado";
        this._round = 1;
      });
    } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Jokenpo",
        style: TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Text("Escolha do App:",
                style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 20,),
              Image.asset(chooseImg(_appChoice))//Image.asset(appChoiceHandler(choice: _playerChoice),)
            ],
           ),
           Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Escolha a sua jogada:",
                style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Exemplo com GestureDetector (verifica interações diversas)
                  // GestureDetector(
                    
                  //   onTap: () => appChoiceHandler(choice: 'pedra'),
                  //    
                  //   //,
                  //   onDoubleTap: (){
                  //     print("imagem duplamente clicada");
                  //   },
                  //   onLongPress: (){
                  //     print("clique longo na imagem");
                  //   },
                  //   child: Image.asset(chooseImg('pedra'), height: 75,)
                  // ),
                  TextButton(
                    onPressed: ()=> appChoiceHandler(choice: 'pedra'),
                    child: Image.asset(chooseImg('pedra'), height: 75,)
                  ),
                  TextButton(
                    onPressed: ()=> appChoiceHandler(choice: 'papel'),
                    child: Image.asset(chooseImg('papel'), height: 75,)
                  ),
                  TextButton(
                    onPressed: ()=> appChoiceHandler(choice: 'tesoura'),
                    child: Image.asset(chooseImg('tesoura'), height: 75,)
                  ),             
                ],
              ),
            ],
           ),
           Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Rodada $_round",
              style: TextStyle(
                color: Colors.orange,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              )),
              SizedBox(height: 10,),
              Text("$_matchResult",
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 25,
                fontWeight: FontWeight.bold
              )),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Computador",
                        style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      )),
                      Text("$_appPoints pts",
                        style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      )),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Jogador",
                        style: TextStyle(
                        color: Colors.lightGreen,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      )),
                      Text("$_playerPoints pts",
                        style: TextStyle(
                        color: Colors.lightGreen,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      )),
                    ],
                  ),
                ],
              ),
              
              SizedBox(height: 50,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  foregroundColor: Colors.amber,
                ),
                onPressed: (){
                   setState(() {
                     resetMatch();
                   });
                }, 
                child: Text("Resetar Jogo",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),),
              )
            ],
           )
          ],
        )
        
      ),
    );
  }
}


