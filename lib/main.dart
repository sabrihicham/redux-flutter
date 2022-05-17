import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:incredux/logic/reducer.dart';
import 'package:incredux/logic/state.dart';
import 'package:incredux/view/routes/router.dart';
import 'package:redux/redux.dart';

void main() {
  final store = Store<CounterState>(counterReducer, initialState: CounterState(0));

  runApp(ReduxApp(store: store));
}

class ReduxApp extends StatelessWidget {
  const ReduxApp({
    Key? key,
    required this.store,
  }) : super(key: key);

  final Store<CounterState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        theme: ThemeData.dark(),
        onGenerateRoute: AppRouter().onGenerateRoute
      ),
    );
  }
}
