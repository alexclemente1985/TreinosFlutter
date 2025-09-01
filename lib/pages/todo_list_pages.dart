
import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget{
  TodoListPage({Key? key}): super(key: key); // quando se cria um controller já não se pode manter o const na frente

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Adicione uma tarefa",
                              hintText: "Ex. Criar aplicativo de tarefas"
                            ),
                          ),

                  ),
                   SizedBox(width: 8,),
                   ElevatedButton(
                    onPressed: () {}, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff00d7f3),
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      )
                    ),
                    child: Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.white,
                    ),
                    )
                  ]
              ),
              SizedBox(height: 16,),
              SizedBox(
                // height: 120,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                      Container(
                        color: Colors.red,
                        height: 50,
                      ),
                      Container(
                        color: Colors.yellow,
                        height: 50,
                      ),
                      Container(
                        color: Colors.green,
                        height: 50,
                      ),
                      Container(
                        color: Colors.blue,
                        height: 150,
                      )
                  ],
              ),
              ),
              SizedBox(height: 16,),
              
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                    "Você possui 0 tarefas pendentes"
                  ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {}, 
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff00d7f3),
                        padding: const EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                        )
                      ),
                      child: Text("Limpar Tudo"),
                    ) 
                  )
                ],
              )
            ],
          ) 
        )
        
    ));
  }
  void login(){
    String text = emailController.text;
    print(text);
    emailController.clear();
  }

  void onChanged(String text){
    print(text);
  }

  void onSubmitted(String text){
    print("on Submitted: "+text); 
  }
}

