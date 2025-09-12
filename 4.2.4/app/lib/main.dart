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
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          title: Text('Aufgabe 4', style: TextStyle(color: Colors.white)),
        ),
        body: Center(
          child: Column(
            spacing: 20,
            children: [
              Headline('Hello App Akademie!', color: Colors.blue),
              Headline('Hello App Akademie!', color: Colors.blue),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ColoredBoxWithTextButton(color: Colors.red, text: 'A'),
                  ColoredBoxWithTextButton(color: Colors.green, text: 'B'),
                  ColoredBoxWithTextButton(color: Colors.blue, text: 'C'),
                ],
              ),
              IconRow(
                icons: [
                  Icons.face,
                  Icons.face,
                ],
              ),
              IconRow(
                icons: [
                  Icons.face,
                  Icons.face,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Headline extends StatelessWidget {
  const Headline(this.text, {super.key, this.color = Colors.black});

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }
}

class ColoredBoxWithTextButton extends StatelessWidget {
  const ColoredBoxWithTextButton({
    super.key,
    required this.color,
    required this.text,
  });

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: color,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          backgroundColor: WidgetStateProperty.all<Color>(Colors.deepPurple),
          foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
          textStyle: WidgetStateProperty.all<TextStyle>(
            TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: null,
        child: Text(text),
      ),
    );
  }
}

class IconRow extends StatelessWidget {
  const IconRow({
    super.key,
    required this.icons,
  });

  final List<IconData> icons;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: icons.map((icon) => Icon(icon, size: 48)).toList(),
    );
  }
}
