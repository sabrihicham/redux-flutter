import 'package:flutter/material.dart';
import 'package:incredux/view/home.dart';
import 'package:redux/redux.dart';
import 'enums.dart' as enums;

int counterReducer(int state, dynamic action) {
  return action == enums.Actions.Increment ? state + 1 : state;
}

void main() {

  final store = Store<int>(counterReducer, initialState: 0);

  runApp(MaterialApp(
            theme: ThemeData.dark(),
    home: Homme(
    store: store,
  ),));
}
