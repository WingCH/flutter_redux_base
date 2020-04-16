import 'package:flutterreduxbase/redux/config/config_action.dart';
import 'package:flutterreduxbase/redux/config/config_state.dart';

ConfigState configReducer(ConfigState state, dynamic action) {
  if (action is UpdateConfigAction) {
    return state.copyWith(lang: action.lang, url: action.url);
  }
  return state;
}
