import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'detail_page.dart';
import 'vehicle.dart';

void main() {
  runApp(const VehicleApp());
}

class VehicleApp extends StatelessWidget {
  const VehicleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan Quiz Vehicle',
      theme: ThemeData(primarySwatch: Colors.teal),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/detail') {
          final vehicle = settings.arguments as Vehicle;
          return MaterialPageRoute(
            builder: (context) => DetailPage(vehicle: vehicle),
          );
        }
        return null;
      },
    );
  }
}
