import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Life Expectancy',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(12),
        width: 150,
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: Colors.cyan),
      ),
    );
  }
}
