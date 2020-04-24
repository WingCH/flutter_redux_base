import 'package:flutterreduxbase/models/loading_status.dart';
import 'package:flutterreduxbase/redux/counter/counter_actions.dart';
import 'package:flutterreduxbase/redux/counter/counter_state.dart';
import 'package:redux/redux.dart';

final counterReducer = combineReducers<CounterState>([
  TypedReducer<CounterState, LoadingAddCounterAction>(_loadingAddCounter),
  TypedReducer<CounterState, UpdateCounterAction>(_updateAddCounter),
]);

CounterState _loadingAddCounter(CounterState state, action) {
  return state.copyWith(counterStatus: LoadingStatus.loading);
}

CounterState _updateAddCounter(CounterState state, action) {
  return state.copyWith(
      counterStatus: LoadingStatus.idle, counter: action.counter);
}
