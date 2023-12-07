import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'login.dart';

// Future<void>
 void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  // await Firebase.initializeApp(
  //     options: FirebaseOptions(
  //       apiKey: "AIzaSyDMy0Qn0QQwQe3mu7BsoyNBlInGFGaR7es",
  //       appId: "1:817530042170:web:c27a683dfbd97bfca0c203",
  //       messagingSenderId: "G-05M7GGJ5DF",
  //       projectId: "chatapp-ae83b",
  //     ));
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'chat',
      theme: ThemeData(
        primaryColor: Colors.red[900],
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}