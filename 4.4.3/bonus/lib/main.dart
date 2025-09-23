import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double _flexVal = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Slider(
                  value: _flexVal,
                  min: 1,
                  max: 5,
                  divisions: 4,
                  onChanged: (value) => {
                    setState(() {
                      _flexVal = value;
                    }),
                  },
                ),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(width: double.infinity, color:Colors.lightBlueAccent, child: Center(child: Text('flex: 1'))),
                      ),
                      Expanded(
                        flex: _flexVal.toInt(),
                        child: Container(width: double.infinity, color: Colors.yellow, child: Center(child: Text('flex: ${_flexVal.toInt()}'))),
                      ),
                      Expanded(
                        child: Container(width: double.infinity, color: Colors.lightBlueAccent, child: Center(child: Text('flex: 1'))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
