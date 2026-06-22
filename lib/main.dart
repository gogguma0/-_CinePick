import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const CinePickApp());
}

class CinePickApp extends StatelessWidget {
  const CinePickApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
