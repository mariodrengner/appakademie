import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final int id;

  const DetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Text('Welcome to the Detail Screen ${id.toString()}');
  }
}
