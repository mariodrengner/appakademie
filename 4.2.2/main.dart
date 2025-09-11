class Text {
  final String text;
  const Text(this.text);
}

class Column {
  final List<Text> children;
  const Column({required this.children});
}

class Center {
  final Column child;
  const Center({required this.child});
}

class Scaffold {
  final Center body;
  const Scaffold({required this.body});
}

class MaterialApp {
  final Scaffold home;
  const MaterialApp({required this.home});
}

void main() {
  MaterialApp(
    home: Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Hallo"),
            Text("Welt")
          ]
        )),
    ),
  );
}
