import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../enums.dart' as enums;

class Screen2 extends StatefulWidget {
  final Store<int> store;
  const Screen2({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<int>(
      store: widget.store,
      child: Scaffold(
        appBar: AppBar(title: Text("User2")),
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
            return () => store.dispatch(enums.Actions.Increment);
          },
          builder: (context, callback) {
            return FloatingActionButton(
              onPressed: callback,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            );
          },
        ),
      ),
    );
  }
}
