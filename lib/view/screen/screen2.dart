import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:incredux/constants/strings.dart';
import 'package:incredux/logic/actions.dart';
import 'package:incredux/logic/state.dart';

class Screen2 extends StatefulWidget {
  const Screen2({
    Key? key,
  }) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(user2)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('The button has been pushed this many times:'),
            StoreConnector<AppState, String>(
              converter: (store) => store.state.counter.toString(),
              builder: (context, counter) => 
                Text(counter, style: Theme.of(context).textTheme.headline4),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => StoreProvider.of<AppState>(context).dispatch(Increment()),
            heroTag: 'tag1',
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () => StoreProvider.of<AppState>(context).dispatch(Decrement()),
            heroTag: 'tag2',
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
