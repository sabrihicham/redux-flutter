import 'package:flutter/material.dart';
import 'package:incredux/constants/strings.dart';

class Home extends StatefulWidget {
  const Home({ Key? key, }) : super(key: key);

  
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, screen1),
            child: const Text(user1)),
          ElevatedButton(
             onPressed: () => Navigator.pushNamed(context, screen2),  
             child: const Text(user2))
        ],
      ),
    ),
    );
  }
}