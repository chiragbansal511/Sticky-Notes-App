import 'package:flutter/material.dart';
import 'package:testapp/screens/home_screen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        '/': (context) => const HomeScreen(),
      },
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(color: Colors.black),
          brightness: Brightness.dark,
          ),
    );
  }
}
