import 'package:incredux/logic/actions.dart';

int counterReducer(int state, dynamic action) {
  if (action is Increment) return state + 1;
  if (action is Decrement) return state - 1;
  throw Exception("$action is not instance of $Action");
}
