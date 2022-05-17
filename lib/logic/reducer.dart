import 'package:incredux/logic/actions.dart';
import 'package:incredux/logic/state.dart';

CounterState counterReducer(CounterState state, dynamic action) {
  if (action is Increment) return CounterState(state.counter + 1);
  if (action is Decrement) return CounterState(state.counter - 1);
  throw Exception("$action is not instance of $Action");
}
