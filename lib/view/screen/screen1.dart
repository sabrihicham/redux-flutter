import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:incredux/logic/actions.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key,}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User 1")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StoreConnector<int, String>(
              converter: (store) => store.state.toString(),
              builder: (context, count) {
                return Text(
                  'The button has been pushed this many times: $count',
                );
              },
            )
          ],
        ),
      ),
 
      floatingActionButton: StoreConnector<int, VoidCallback>(
        converter: (store) {
          return () => store.dispatch(Increment());
        },
        builder: (context, callback) {
          return FloatingActionButton(
            onPressed: callback,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          );
        },
      ),
    );
  }
}
