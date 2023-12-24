import 'package:flutter/material.dart';
import 'package:testapp/screens/file.dart';
import 'package:testapp/screens/home.dart';

void main() {
  runApp(  Myapp());
}

class Myapp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' :(context) =>  Home(),
        '/fileread' :(context) =>  Fileread()
      }, 
    );
  }
}