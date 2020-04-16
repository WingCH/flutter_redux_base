import 'package:flutterreduxbase/redux/app/app_state.dart';
import 'package:flutterreduxbase/redux/config/config_reducer.dart';
import 'package:flutterreduxbase/redux/counter/counter_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return new AppState(
    configState: configReducer(state.configState, action),
    counterState: counterReducer(state.counterState, action),
  );
}
