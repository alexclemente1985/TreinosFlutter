import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeStateful()
    // home: Container(
    
    //   //color: Colors.white,
    //   //padding: EdgeInsets.fromLTRB(0,0,0,0),
    //   margin: EdgeInsets.only(top: 40),
    //   //margin: EdgeInsets.only(top: 50), //para medidas individuais
    //   //margin: EdgeInsets.fromLTRB(10,20,30,60),//EdgeInsets.all(30),
    //   decoration: BoxDecoration(
    //     border: Border.all(width: 3, color: Colors.white)
    //   ),
    //   child: Image.asset(
    //     "images/mesa.jpg",
    //     fit: BoxFit.scaleDown
    //   )
    //   // Row(
    //   //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //   //   crossAxisAlignment: CrossAxisAlignment.stretch,
    //   //   children: [
    //   //      Text("T1"),
    //   //      Text("T2"),
    //   //      Text("T3"),
    //   //     // Padding(
    //   //     //   padding: EdgeInsets.all(30),
    //   //     //   child: Text("T2"),
    //   //     //   )
    //   //     // TextButton(onPressed: ()=> {print("Botão pressionado")}, 
    //   //     //   child: Text(
    //   //     //     "Clique aqui!",
    //   //     //     style: TextStyle(
    //   //     //       fontSize: 50,
    //   //     //       color: Colors.black,
    //   //     //       decoration: TextDecoration.none
    //   //     //     )
    //   //     //   ),
    //   //     // )
        
    //   //     // Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec posuere dolor massa, ut fermentum elit finibus eget. Sed sem purus, aliquet vel condimentum a, faucibus quis sem. Cras non mauris quis risus semper dapibus. Donec vel orci ligula. Integer eu nisi accumsan, suscipit sapien ac, dignissim magna. Praesent fermentum neque at pellentesque commodo. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque in ipsum fringilla, auctor massa ornare, iaculis erat. Nam nunc libero, faucibus at euismod laoreet, scelerisque et nunc. Integer lobortis tincidunt neque, id volutpat elit ornare id. Ut id libero interdum, imperdiet purus sit amet, mattis enim. Etiam faucibus consequat risus eget rutrum. Nulla eu massa leo. Fusce sollicitudin urna eu nibh fermentum, nec pellentesque magna hendrerit.",
    //   //     // style: TextStyle(
    //   //     //   fontSize: 25,
    //   //     //   fontStyle: FontStyle.normal,
    //   //     //   fontWeight: FontWeight.normal,
    //   //     //   letterSpacing: 0,
    //   //     //   wordSpacing: 0,
    //   //     //   decoration: TextDecoration.underline,
    //   //     //   decorationColor: Colors.greenAccent,
    //   //     //   decorationStyle: TextDecorationStyle.solid,
    //   //     //   color: Colors.black
    //   //     // ),),
    //   //     ]
    //   // ),
    // )
  ));
}

class HomeStateful extends StatefulWidget {
  @override
  _HomeStatefulState createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful>{
  var _texto = "Alexandre Pinheiro";

  @override
  Widget build(BuildContext context){    

    return Scaffold(
      appBar: AppBar(
        title: Text("Instagram",
        style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber
              ),
              onPressed: (){
                setState(() {
                  _texto = "Curso de Flutter";
                });
                },
              child: Text("Clique aqui!"),
            ),
            Text("Nome: $_texto")
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var titulo = "Instagram";

    return Scaffold(
      appBar: AppBar(
        title: Text("Título",
        style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Text("Conteúdo principal")
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightGreen,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Text("Texto 1"),
              Text("Texto 2"),
            ],),
        )
      ),
    );
  }
}