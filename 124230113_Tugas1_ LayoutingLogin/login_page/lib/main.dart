import 'package:flutter/material.dart';
import 'login.dart'; // import file login.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login App",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginScreen(), // arahkan ke halaman login
    );
  }
}
