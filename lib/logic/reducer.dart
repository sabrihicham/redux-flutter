import 'package:incredux/logic/actions.dart';
import 'package:incredux/logic/state.dart';

AppState counterReducer(AppState state, dynamic action) {
  if (action is Increment) return AppState(counter: state.counter + 1);
  if (action is Decrement) return AppState(counter: state.counter - 1);
  throw Exception("$action is not instance of $Action");
}
