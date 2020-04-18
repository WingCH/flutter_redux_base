import 'package:flutterreduxbase/models/loading_status.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

import '../../models/counter.dart';
import '../../redux/app/app_state.dart';

class CounterLabelViewModel {
  final Counter counter;
  final LoadingStatus loadingStatus;

  CounterLabelViewModel({
    @required this.counter,
    @required this.loadingStatus,
  });

  static CounterLabelViewModel fromStore(
      Store<AppState> store,
      ) {
    return CounterLabelViewModel(
        counter: store.state.counterState.counter,
        loadingStatus: store.state.counterState.counterStatus);
  }

  @override
  bool operator ==(other) {
    return identical(this, other) ||
        other is CounterLabelViewModel &&
            runtimeType == other.runtimeType &&
            counter == other.counter &&
            loadingStatus == other.loadingStatus;
  }

  @override
  int get hashCode {
    return counter.hashCode ^ loadingStatus.hashCode;
  }
}
