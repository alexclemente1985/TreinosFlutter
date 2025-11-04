import 'package:flutter/material.dart';
import 'package:flutter_intermediate/sections/section_4/widgets/custom_widget_test.dart';

class Authenticator extends StatefulWidget{
  Authenticator({required Key key, required this.onAuthenticated});
  final ValueChanged<bool> onAuthenticated;

  @override
  _AuthenticatorState createState() => _AuthenticatorState(onAuthenticated);
}

class _AuthenticatorState extends State<Authenticator>{

  _AuthenticatorState(this.onAuthenticated);

  late TextEditingController _user;
  late TextEditingController _pass;
  final ValueChanged<bool> onAuthenticated;

  void _onClick(){
    if(_user.text != 'user' || _pass.text != '1234'){
      onAuthenticated(false);
    }
    else{
      onAuthenticated(true);
    }
  }

  @override
  void initState() {
    _pass = TextEditingController();
    _user = TextEditingController();
  }

  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: _user,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _pass,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: _onClick, 
                child: Text('Login')
                ),

              )
          ],
        ),),
    );
  }
  
}