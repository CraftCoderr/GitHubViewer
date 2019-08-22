import 'package:flutter/material.dart';
import 'package:github_viewer/repo_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        appBarTheme: AppBarTheme(
          color: Colors.black, 
          textTheme: TextTheme(
            title: TextStyle(color: Colors.white),
            subtitle: TextStyle(color: Colors.grey),
          ),
        ),
      ),
      home: RepoScreen(),
    );
  }
}
