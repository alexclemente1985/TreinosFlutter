import 'package:flutter/material.dart';
import 'package:flutter_intermediate/sections/section_4/widgets/time_counter.dart';
import 'package:flutter_intermediate/sections/section_6/section_6.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

// void main(){
//   final store = Store(reducer, initialState: 0);
// }

// Não precisa ser StatefulWidget pq o redux já faz todo o trabalho de state
class Redux extends StatelessWidget {
  
  Redux({required Key key, required this.store});

  final Store<int> store;

  
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: this.store, 
      child: Scaffold(
        appBar: AppBar(
          title: Text('Store - Flutter Redux Screen'),
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StoreConnector<int, String>(
                  builder: (context, count){
                    return Text(count, style: TextStyle(fontSize: 24));
                  }, 
                  converter: (store) => store.state.toString()
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: ()=> store.dispatch(FlutterActions.Increment), 
                      icon: Icon(Icons.add)),
                    IconButton(
                      onPressed: ()=> store.dispatch(FlutterActions.Decrement), 
                      icon: Icon(Icons.remove))
                  ],
                )
              ],
            )
          )
        ),
      )
    );
  }
}

// class Redux extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() => ReduxState();
// }

// class ReduxState extends State<Redux>{
//   @override
//   Widget build(BuildContext context) {

//     final args = ModalRoute.of(context)!.settings.arguments;
//     final Map<String,dynamic> data = args as Map<String,dynamic>;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Store - Redux Screen'),
//         backgroundColor: Colors.lightGreen,
//         foregroundColor: Colors.black87,
//       ),
//       body: Container(
//         padding: EdgeInsets.all(32),
//         child: Center(
//           child: Column(
//             children: [
//               Text('Teste de navegação pushNamed!'),
//               ElevatedButton(
//                 onPressed: (){
//                   if (Navigator.of(context).canPop()){
//                     Navigator.pop(context); //remove a página atual da listagem, retornando para a página abaixo na lista (caso não exista, o .canPop() vai impedir)
//                   }
                  
//                 }, 
//                 child: Text("Pop!")
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
  
// }