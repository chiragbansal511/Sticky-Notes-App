import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';



class Fileread extends StatefulWidget {
  
   Fileread({super.key});

  @override
  _FilereadState createState() => _FilereadState();
}

class _FilereadState extends State<Fileread> {

   ThemeData mode = ThemeData.dark();
    IconData modeicon = Icons.light_mode;
  final name = TextEditingController();
  final data = TextEditingController();
   String finalname = '';
   String finaldata = '';
   String allfilenames = "";

  @override


  @override
   void initState() {
    super.initState();

    readCounter().then((value) {
      setState(() {
        allfilenames = value ;
      });
    });
  }

      Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$finalname.txt');
  }   
  
  Future<String> readCounter() async {
    try {
      final path = await _localPath;
      final file = await File('$path/allfilenames.txt');

      // Read the file
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return "";
    }
  }

  Future<File> writeCounter(String data) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$data');
  }

   Future<File> savedata(String data){
    return writeCounter(data);
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
         icon: Icon(modeicon)),],

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
             icon: Icon(Icons.drive_file_rename_outline_rounded),
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

       floatingActionButton: FloatingActionButton(onPressed:  () 
      async {
        finalname = name.text ;
        finaldata = data.text ;

        Navigator.pushNamed(context, '/');
       await savedata(finaldata);
        allfilenames = allfilenames + finalname + ' ';
        finalname = "allfilenames" ;
        savedata(allfilenames);
        } ,
        
         child: Icon(Icons.save , color: Colors.white,) , backgroundColor: Colors.lightBlue,),
    ),

    theme: mode,
    );
  }
}