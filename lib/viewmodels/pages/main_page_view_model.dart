import 'package:flutterreduxbase/redux/app/app_state.dart';
import 'package:flutterreduxbase/redux/counter/counter_actions.dart';
import 'package:flutterreduxbase/viewmodels/widgets/counter_label_view_model.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class MainPageViewModel {
  final String lang;
  final String url;
  final Function addCounter;

  MainPageViewModel({
    @required this.lang,
    @required this.url,
    @required this.addCounter,
  });

  static MainPageViewModel fromStore(
    Store<AppState> store,
  ) {
    return MainPageViewModel(
      lang: store.state.configState.lang,
      url: store.state.configState.url,
      addCounter: () => store.dispatch(AddCounterAction()),
    );
  }

  @override
  bool operator ==(other) {
    return identical(this, other) ||
        other is MainPageViewModel &&
            runtimeType == other.runtimeType &&
            lang == other.lang &&
            url == other.url;
  }

  @override
  int get hashCode {
    return lang.hashCode ^ url.hashCode;
  }

  static counterLabelViewModel(Store<AppState> store) {
    return CounterLabelViewModel.fromStore(store);
  }
}
