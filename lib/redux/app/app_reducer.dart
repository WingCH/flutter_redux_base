import 'package:flutterreduxbase/redux/app/app_state.dart';
import 'package:flutterreduxbase/redux/counter/counter_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return new AppState(
    counterState: counterReducer(state.counterState, action),
  );
}
