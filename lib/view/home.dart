


import 'package:flutter/material.dart';
import 'package:incredux/view/screen1.dart';
import 'package:incredux/view/screen2.dart';
import 'package:redux/redux.dart';
import '../enums.dart' as enums;


class Homme extends StatefulWidget {
    final Store<int> store;
  const Homme({
    Key? key,
    required this.store,
  }) : super(key: key);

  
  @override
  State<Homme> createState() => _HommeState();
}
class _HommeState extends State<Homme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(onPressed: () {
          Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  Screen1(store: widget.store,)),
      );
        }, child: Text("User1"))
        
        ,ElevatedButton(onPressed: () {
          Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  Screen2(store: widget.store,)),
      );
        }, child: Text("User2"))
          
        ],
      ),
    ),
    );
  }
}