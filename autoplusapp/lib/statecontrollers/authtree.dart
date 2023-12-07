import 'package:autoplusapp/database/authentication.dart';
import 'package:autoplusapp/navcontroller/navigationBar.dart';
import 'package:autoplusapp/pages/signupPage.dart';
import 'package:flutter/material.dart'; 

class authTree extends StatefulWidget{
  const authTree({super.key});

  @override
  State<authTree> createState() => _authTreeState();
}

class _authTreeState extends State<authTree>{

  @override
  Widget build(BuildContext context){
    return StreamBuilder(
      stream: Authentication().authStateChanges,
     builder: (context, snapshot){
      if (snapshot.hasData){
        return const navigationBar();
      } else{
        return const signupPage();
      }
    });

  }
}
