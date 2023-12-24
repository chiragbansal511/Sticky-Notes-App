import 'package:flutter/material.dart';

class Fileread extends StatefulWidget {
  const Fileread({ Key? key }) : super(key: key);

  @override
  _FilereadState createState() => _FilereadState();
}

class _FilereadState extends State<Fileread> {

   ThemeData mode = ThemeData.dark();
    IconData modeicon = Icons.light_mode;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title:  Center(child: Text("New File" , style: TextStyle( fontWeight: FontWeight.bold , ),),),
        actions: [IconButton(onPressed: () {
           if(mode == ThemeData.dark())
           {
            setState(() {
              mode = ThemeData.light();
              modeicon = Icons.dark_mode;
            });
           }

           else {
            setState(() {
              mode = ThemeData.dark();
              modeicon = Icons.light_mode ;
            });
           }
        },
         icon: Icon(modeicon))],

         backgroundColor: Colors.blue,
         elevation: 10,
      ),

       floatingActionButton: FloatingActionButton(onPressed: () {Navigator.pushNamed(context, '/');} , child: Icon(Icons.save , color: Colors.white,) , backgroundColor: Colors.lightBlue,),
    ),

    theme: mode,
    );
  }
}