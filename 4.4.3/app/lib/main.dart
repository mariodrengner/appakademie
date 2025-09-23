import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(child: Text('Willkommen zur App!', style: TextStyle(fontSize: 24))),
              ),
              Expanded(
                flex: 3,
                child: Image.network('https://images.unsplash.com/photo-1651592279311-120424784c06?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1', fit: BoxFit.cover),
              ),
              Expanded(
                child: Center(child: Text('🐷 Schwein gehabt 🐷', style: TextStyle(fontSize: 16))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
