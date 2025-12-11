import 'package:banco_douro/models/account.dart';
import 'package:banco_douro/ui/styles/app_color.dart';
import 'package:banco_douro/ui/widgets/account_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sistema de Gestão de Contas"),
        backgroundColor: AppColor.lightGrey,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, "login");
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: AccountWidget(
        account: Account(
          id: "ID001",
          name: "Alexandre",
          lastName: "Pinheiro",
          balance: 200,
          accountType: null
          )
      ),
        )
    );
  }
}
