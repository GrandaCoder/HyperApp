import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

class PageSecond extends StatefulWidget {
  const PageSecond({super.key});

  @override
  State<PageSecond> createState() => _PageSecondState();
}

class _PageSecondState extends State<PageSecond> {
  @override
  Widget build(BuildContext context) {
    return listas();
  }
}

ListView listas(){
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (BuildContext context, int index) 
    { 
      return Image.network(
        "https://picsum.photos/id/$index/400/200",
        height: 200,
      );
    },
  
);
}