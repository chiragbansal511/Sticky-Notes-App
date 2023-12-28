import "package:flutter/material.dart";
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Showfile extends StatefulWidget {
   Showfile({ Key? key  , required this.filename});
  
  String filename = "";
  @override
  _ShowfileState createState() => _ShowfileState(filename: this.filename);
}

class _ShowfileState extends State<Showfile> {

  ThemeData mode = ThemeData.dark();
  IconData modeicon = Icons.light_mode;
  String filename ;
  String data = '';
  _ShowfileState({required this.filename});


 Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }
  
   
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$filename.txt');
  }

  Future<String> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return "";
    }
  }
  
  void initState() {
    super.initState();
    readCounter().then((value) {
      setState(() {
        data = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:  Center(
            child: Text(
              filename,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  if (mode == ThemeData.dark()) {
                    setState(() {
                      mode = ThemeData.light();
                      modeicon = Icons.dark_mode;
                    });
                  } else {
                    setState(() {
                      mode = ThemeData.dark();
                      modeicon = Icons.light_mode;
                    });
                  }
                },
                icon: Icon(modeicon))
          ],
          backgroundColor: const Color.fromARGB(255, 7, 132, 235),
          elevation: 10,
        ),
         
       body : Container(
          child: Text(data , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.normal , ),),
       ) ,
      
      floatingActionButton: FloatingActionButton(onPressed: () {Navigator.pop(context);} , child: Icon(Icons.home_filled , color: Colors.white,) , backgroundColor: Colors.lightBlue,),
     ),
      theme: mode,
      
    );
  }
}
