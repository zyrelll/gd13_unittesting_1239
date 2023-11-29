import 'package:flutter/material.dart';
import 'package:gd13_unittesting_1239/pages/login_page.dart';

void main() => runApp(const LoadLoginPage());

class LoadLoginPage extends StatelessWidget {
  const LoadLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const LoginPage(),
    );
  }
}
