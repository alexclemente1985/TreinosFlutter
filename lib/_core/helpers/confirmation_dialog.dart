import 'package:flutter/material.dart';

Future<bool?> showConfirmationDialog(BuildContext context, String text, Function operation){
  return showDialog(
      context: context, 
      builder: (context){
      return AlertDialog(
        title: Text("Atenção"),
        content: Text(text),
        actions: [
          ElevatedButton(
            onPressed: (){
              Navigator.pop(context);
            }, 
            child: Text("Cancelar")
          ),
          ElevatedButton(
            onPressed: (){
              operation();
              Navigator.pop(context);
            }, 
            child: Text("Confirmar")
          ),
        
        ],
        );
    });
}