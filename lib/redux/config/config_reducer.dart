import 'package:flutterreduxbase/redux/config/config_action.dart';
import 'package:flutterreduxbase/redux/config/config_state.dart';
import 'package:redux/redux.dart';

final configReducer = combineReducers<ConfigState>([
  TypedReducer<ConfigState, UpdateConfigAction>(_updateConfig),
]);

ConfigState _updateConfig(ConfigState state, action) {
  return state.copyWith(lang: action.lang, url: action.url);
}
