import 'package:flutterreduxbase/redux/app/app_state.dart';
import 'package:flutterreduxbase/redux/counter/counter_actions.dart';
import 'package:flutterreduxbase/viewmodels/widgets/counter_label_view_model.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class CounterCardViewModel {
  final Function addCounter;

  CounterCardViewModel({
    @required this.addCounter,
  });

  static CounterCardViewModel fromStore(
    Store<AppState> store,
  ) {
    return CounterCardViewModel(
      addCounter: () => store.dispatch(AddCounterAction()),
    );
  }

  static counterLabelViewModel(Store<AppState> store) {
    return CounterLabelViewModel.fromStore(store);
  }
}
