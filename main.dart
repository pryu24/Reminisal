import 'package:flutter/material.dart';
import 'lifepuzzle.dart';
import 'userprofile.dart';
import 'avatar_selection.dart'; 
import 'home.dart';
import 'login.dart';
import 'chat.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.orange,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/puzzle': (context) => LifePuzzle(),
        '/profile': (context) =>UserProfile(),
        '/WarmLoginPage': (context) => WarmLoginPage(),
        '/ChatScreen': (context) => ChatScreen(),
        
      },
    );
  }
}
