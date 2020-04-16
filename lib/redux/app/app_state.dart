import 'package:flutterreduxbase/redux/config/config_state.dart';
import 'package:flutterreduxbase/redux/counter/counter_state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final ConfigState configState;
  final CounterState counterState;

  AppState({
    @required this.configState,
    @required this.counterState,
  });

  factory AppState.initial() {
    return AppState(
      configState: ConfigState.initial(),
      counterState: CounterState.initial(),
    );
  }

  AppState copyWith({
    ConfigState configState,
    CounterState counter,
  }) {
    return AppState(
      configState: configState ?? this.configState,
      counterState: counter ?? this.counterState,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is AppState &&
            runtimeType == other.runtimeType &&
            configState == other.configState &&
            counterState == other.counterState;
  }

  @override
  int get hashCode {
    return configState.hashCode ^ counterState.hashCode;
  }
}
