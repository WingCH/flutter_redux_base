import 'package:flutterreduxbase/models/loading_status.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

import '../../models/counter.dart';
import '../../redux/app/app_state.dart';

class CounterLabelViewModel {
  final LoadingStatus loadingStatus;
  final Counter counter;

  CounterLabelViewModel({
    @required this.loadingStatus,
    @required this.counter,
  });

  static CounterLabelViewModel fromStore(
    Store<AppState> store,
  ) {
    return CounterLabelViewModel(
      loadingStatus: store.state.counterState.counterStatus,
      counter: store.state.counterState.counter,
    );
  }

  @override
  bool operator ==(other) {
    return identical(this, other) ||
        other is CounterLabelViewModel &&
            runtimeType == other.runtimeType &&
            loadingStatus == other.loadingStatus &&
            counter == other.counter;
  }

  @override
  int get hashCode {
    return loadingStatus.hashCode ^ counter.hashCode;
  }
}
