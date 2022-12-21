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
      children: [
       // Image.network(),
        const SizedBox(
          height: 20,
        ),
        Text("Bienvenido"),
        const SizedBox(
          height: 20,
        ),
        MaterialButton(
          onPressed: () {
            print("Pa fuera");
          },
          height: 50,
          minWidth: 100,
          color: Colors.red,
          child: const Text(
            'Logout',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    ),
  );
}
