import 'package:flutter/material.dart';

class PageSecond extends StatefulWidget {
  const PageSecond({super.key});

  @override
  State<PageSecond> createState() => _PageSecondState();
}

class _PageSecondState extends State<PageSecond> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Hola"),
        Text("Practica 2"),
      ],
    );
  }
}