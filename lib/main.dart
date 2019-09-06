import 'package:flutter/material.dart';
import 'repo/repo_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch: Colors.grey,
        appBarTheme: AppBarTheme(
          color: Color.fromARGB(255, 36, 41, 46), 
          textTheme: TextTheme(
            title: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15),
            subtitle: TextStyle(color: Color.fromARGB(255, 197, 198, 199)),
          ),
        ),
      ),
      home: RepoScreen(),
    );
  }
}
