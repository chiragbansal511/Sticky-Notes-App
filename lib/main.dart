import 'package:flutter/material.dart';
import 'package:testapp/screens/newfile.dart';
import 'package:testapp/screens/home.dart';
import 'package:testapp/screens/showfile.dart';

void main() {
  runApp(  Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({ Key? key });

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' :(context) =>  const Home(),
        '/fileread' :(context) =>  Fileread(),
      }, 
    );
  }
}