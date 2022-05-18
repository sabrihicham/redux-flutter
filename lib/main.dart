import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:incredux/logic/reducer.dart';
import 'package:incredux/logic/state.dart';
import 'package:incredux/view/routes/router.dart';
import 'package:redux/redux.dart';

void main() {
  runApp(const ReduxApp());
}

class ReduxApp extends StatelessWidget {
  const ReduxApp({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: Store<AppState>(counterReducer, initialState: AppState(counter: 0)),
      child: MaterialApp(
        theme: ThemeData.dark(),
        onGenerateRoute: AppRouter().onGenerateRoute
      ),
    );
  }
}
