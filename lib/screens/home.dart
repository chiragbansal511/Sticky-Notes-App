import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  ThemeData mode = ThemeData.dark();
  IconData modeicon = Icons.light_mode;

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
         
       
        floatingActionButton: FloatingActionButton(onPressed: () {Navigator.pushNamed(context, '/fileread');} , child: Icon(Icons.add , color: Colors.white,) , backgroundColor: Colors.lightBlue,),
        ),
      theme: mode,
    );
  }
}
