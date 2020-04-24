import 'package:flutterreduxbase/redux/app/app_state.dart';
import 'package:flutterreduxbase/redux/counter/counter_actions.dart';
import 'package:flutterreduxbase/redux/counter/counter_middleware.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> appMiddleware() {
  return [
    TypedMiddleware<AppState, AddCounterAction>(addCounterMiddleware()),
  ];
}
