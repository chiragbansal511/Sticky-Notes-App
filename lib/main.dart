import 'package:flutter/material.dart';
import 'package:testapp/screens/file.dart';
import 'package:testapp/screens/home.dart';

void main() {
  runApp( const Myapp());
}

class Myapp extends StatelessWidget {
const Myapp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' :(context) => const Home(),
        '/fileread' :(context) => const Fileread()
      }, 
    );
  }
}