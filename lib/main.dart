import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';
import 'welcome.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tourist Helper',
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
      ),
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => const Welcome(),
        '/': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
