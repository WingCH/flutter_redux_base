import 'package:flutter/material.dart';
import 'package:flutterreduxbase/redux/app/app_state.dart';
import 'package:redux/redux.dart';

class ConfigCardViewModel {
  final String lang;
  final String url;

  ConfigCardViewModel({
    @required this.lang,
    @required this.url,
  });

  static ConfigCardViewModel fromStore(
    Store<AppState> store,
  ) {
    return ConfigCardViewModel(
      lang: store.state.configState.lang,
      url: store.state.configState.url,
    );
  }

  @override
  bool operator ==(other) {
    return identical(this, other) ||
        other is ConfigCardViewModel &&
            runtimeType == other.runtimeType &&
            lang == other.lang &&
            url == other.url;
  }

  @override
  int get hashCode {
    return lang.hashCode ^ url.hashCode;
  }
}
