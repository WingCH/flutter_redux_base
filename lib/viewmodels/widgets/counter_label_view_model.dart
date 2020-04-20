import 'package:flutterreduxbase/models/loading_status.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

import '../../models/counter.dart';
import '../../redux/app/app_state.dart';

class CounterLabelViewModel {
  final LoadingStatus counterStatus;
  final Counter counter;
  final LoadingStatus loadingStatus;

  CounterLabelViewModel({
    @required this.counterStatus,
    @required this.counter,
    @required this.loadingStatus,
  });

  static CounterLabelViewModel fromStore(
      Store<AppState> store,
      ) {
    return CounterLabelViewModel(
      counterStatus: store.state.counterState.counterStatus,
      counter: store.state.counterState.counter,
    );
  }

  @override
  bool operator ==(other) {
    return identical(this, other) ||
        other is CounterLabelViewModel &&
            runtimeType == other.runtimeType &&
            counterStatus == other.counterStatus &&
            counter == other.counter;
  }

  @override
  int get hashCode {
    return counterStatus.hashCode ^ counter.hashCode;
  }
}
