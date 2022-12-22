
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hindText;
  final bool obscureText;
  
    const MyTextField({
      required this.controller,
      required this.hindText,
      required this.obscureText,
    });

  @override
  Widget build(BuildContext context) {
    return             //username texfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: controller,
                obscureText: obscureText,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),       
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),

                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintText: hindText,
                  hintStyle: TextStyle(color: Colors.grey[500]),

                ),
              ),
            );
  }
}