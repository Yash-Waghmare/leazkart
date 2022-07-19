import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:leazkart/login.dart';
import 'package:leazkart/signup.dart';
import 'package:leazkart/homescreen.dart';
import 'package:leazkart/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(leazkart());
}
class leazkart extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: welcome.id,
      routes: {
        welcome.id:(context)=>welcome(),
        login.id:(context)=>login(),
        signup.id:(context)=>signup(),
        home.id:(context)=>home(),
      },
    );
  }
}

