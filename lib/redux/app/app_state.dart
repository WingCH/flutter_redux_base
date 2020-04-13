import 'package:flutterreduxbase/redux/counter/counter_state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final CounterState counterState;

  AppState({
    @required this.counterState,
  });

  factory AppState.initial() {
    return AppState(
      counterState: CounterState.initial(),
    );
  }

  AppState copyWith({
    CounterState counter,
  }) {
    return AppState(
      counterState: counter ?? this.counterState,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is AppState &&
            runtimeType == other.runtimeType &&
            counterState == other.counterState;
  }

  @override
  int get hashCode {
    return counterState.hashCode;
  }
}
