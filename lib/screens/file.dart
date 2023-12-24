import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';



class Fileread extends StatefulWidget {
  const Fileread({super.key});

  @override
  _FilereadState createState() => _FilereadState();
}

class _FilereadState extends State<Fileread> {

   ThemeData mode = ThemeData.dark();
    IconData modeicon = Icons.light_mode;
  final name = TextEditingController();
  final data = TextEditingController();
   String finalname = '' ;
   String finaldata = '';
   
  @override


  @override
   void initState() {
    super.initState();

    // Start listening to changes.
    name.addListener(() {finalname = name.text;});
    data.addListener(() {finaldata = data.text;});
  }
      Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }   
  
  Future<File> writeCounter(String counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }

   Future<File> savedata(){
    return writeCounter(finaldata);
   }
   
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
            
       body: Form(
         key: GlobalKey(),
        child: Column(
          children: [
            TextFormField(
             autofocus: true ,
             controller: name,
             style: TextStyle(fontSize: 20 , fontWeight: FontWeight.normal , ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },

            decoration: const  InputDecoration(
             icon: Icon(Icons.file_copy_rounded),
             hintText: "Heading",
              hoverColor: Color(0xFFFF9000),
               border: OutlineInputBorder(),
            ),
          ),

          TextFormField(
            autofocus: true,
            controller: data,
            decoration: InputDecoration(label: Text("Enter Text")),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),

          ],
        )),

       floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, '/');
        savedata();
        } , child: Icon(Icons.save , color: Colors.white,) , backgroundColor: Colors.lightBlue,),
    ),

    theme: mode,
    );
  }
}