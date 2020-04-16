import 'package:flutterreduxbase/models/loading_status.dart';
import 'package:flutterreduxbase/redux/app/app_state.dart';
import 'package:flutterreduxbase/redux/counter/counter_actions.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class MainPageViewModel {
  final LoadingStatus status;
  final Function addCounter;

  MainPageViewModel({
    @required this.status,
    @required this.addCounter,
  });

  static MainPageViewModel fromStore(
    Store<AppState> store,
  ) {
    return MainPageViewModel(
      status: store.state.counterState.counterStatus,
      addCounter: () => store.dispatch(AddCounterAction()),
    );
  }

  @override
  bool operator ==(other) {
    return identical(this, other) ||
        other is MainPageViewModel &&
            runtimeType == other.runtimeType &&
            status == other.status;
  }

  @override
  int get hashCode {
    return status.hashCode;
  }
}
