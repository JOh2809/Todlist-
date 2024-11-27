import 'package:flutter/material.dart';

void main() {
  runApp(const Todlist());
}

class Todlist extends StatelessWidget {
  const Todlist({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: " Welcome To Do List",
      debugShowCheckedModeBanner: false,
    );
  }
}
