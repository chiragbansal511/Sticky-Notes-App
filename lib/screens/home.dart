import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';



class Home extends StatefulWidget {
  const Home({super.key});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  ThemeData mode = ThemeData.dark();
  IconData modeicon = Icons.light_mode;
  String data = "";

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }
  
   
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/allfilenames.txt');
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
          title: const Center(
            child: Text(
              "Home",
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
         
       body: Text(data),
        floatingActionButton: FloatingActionButton(onPressed: () {Navigator.pushNamed(context, '/fileread');} , child: Icon(Icons.add , color: Colors.white,) , backgroundColor: Colors.lightBlue,),
        ),
      theme: mode,
    );
  }
}
