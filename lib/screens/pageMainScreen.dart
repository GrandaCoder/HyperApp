import 'package:flutter/material.dart';

class MyMainPage extends StatefulWidget {
  const MyMainPage({super.key});


  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {


  @override
  Widget build(BuildContext context) {
    return _informacionUsuario();
  }
}

Widget _informacionUsuario() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
       // Image.network(),
        SizedBox(
          height: 20,
        ),
        Text("Bienvenido"),
        SizedBox(
          height: 20,
        ),
      ],
    ),
  );
}
