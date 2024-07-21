import 'package:animatedcircularprogressindicator/AnimatedCircularProgressIndicator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const app());
}

// ignore: camel_case_types
class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AnimatedCircularProgressIndicator(
          progress: 0.67,
        ),
      ),
    );
  }
}
