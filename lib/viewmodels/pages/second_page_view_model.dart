import 'package:flutterreduxbase/redux/app/app_state.dart';
import 'package:flutterreduxbase/utils/keys.dart';
import 'package:flutterreduxbase/viewmodels/widgets/counter_card_view_model.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class SecondPageViewModel {
  final Function goToMainPage;

  SecondPageViewModel({
    @required this.goToMainPage,
  });

  static SecondPageViewModel fromStore(
    Store<AppState> store,
  ) {
    return SecondPageViewModel(
      goToMainPage: () => Keys.navigatorKey.currentState.pop(),
    );
  }

  static counterCardViewModel(Store<AppState> store) {
    return CounterCardViewModel.fromStore(store);
  }
}
