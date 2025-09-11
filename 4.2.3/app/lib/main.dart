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
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title: Text('Hello'),
        ),
        body: Container(
          color: Colors.black,
          child: Column(
            children: [
              Image.asset('assets/images/world.png'),
              Text(
                'World',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
