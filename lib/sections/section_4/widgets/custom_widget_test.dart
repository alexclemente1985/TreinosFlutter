import 'package:flutter/widgets.dart';

class CustomWidgetTest extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      child: Text('Este é um widget customizado'),
    );
  }
}