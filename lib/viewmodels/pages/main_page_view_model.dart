import 'package:flutterreduxbase/redux/app/app_state.dart';
import 'package:flutterreduxbase/redux/config/config_action.dart';
import 'package:flutterreduxbase/redux/counter/counter_actions.dart';
import 'package:flutterreduxbase/utils/keys.dart';
import 'package:flutterreduxbase/utils/routers.dart';
import 'package:flutterreduxbase/viewmodels/widgets/config_card_view_model.dart';
import 'package:flutterreduxbase/viewmodels/widgets/counter_label_view_model.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class MainPageViewModel {
  final Function addCounter;
  final Function goToSecondPage;
  final Function updateConfig;

  MainPageViewModel({
    @required this.addCounter,
    @required this.goToSecondPage,
    @required this.updateConfig,
  });

  static MainPageViewModel fromStore(
    Store<AppState> store,
  ) {
    return MainPageViewModel(
        addCounter: () => store.dispatch(AddCounterAction()),
        goToSecondPage: () =>
            Keys.navigatorKey.currentState.pushNamed(Routes.secondPage),
        updateConfig: () {
          if (store.state.configState.lang == "en") {
            store.dispatch(
              UpdateConfigAction("zh", "www.google.com"),
            );
          } else {
            store.dispatch(
              UpdateConfigAction("en", "www.google.com"),
            );
          }
        });
  }

  static counterLabelViewModel(Store<AppState> store) {
    return CounterLabelViewModel.fromStore(store);
  }

  static configCardViewModel(Store<AppState> store) {
    return ConfigCardViewModel.fromStore(store);
  }
}
