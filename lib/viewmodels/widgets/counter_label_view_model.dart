import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

import '../../models/counter.dart';
import '../../redux/app/app_state.dart';

class CounterLabelViewModel {
  final Counter counter;

  CounterLabelViewModel({
    @required this.counter,
  });

  static CounterLabelViewModel fromStore(
    Store<AppState> store,
  ) {
    return CounterLabelViewModel(
      counter: store.state.counterState.counter,
    );
  }

  @override
  bool operator ==(other) {
    return identical(this, other) ||
        other is CounterLabelViewModel &&
            runtimeType == other.runtimeType &&
            counter == other.counter;
  }

  @override
  int get hashCode {
    return counter.hashCode;
  }
}
