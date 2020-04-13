import 'dart:async';

import 'package:flutterreduxbase/models/counter.dart';
import 'package:flutterreduxbase/models/loading_status.dart';
import 'package:flutterreduxbase/redux/app/app_state.dart';
import 'package:flutterreduxbase/redux/counter/counter_actions.dart';
import 'package:redux/redux.dart';

class CounterMiddleware extends MiddlewareClass<AppState> {
  @override
  call(Store<AppState> store, dynamic action, NextDispatcher next) {
    next(action);

    if (action is AddCounterAction) {
      if (store.state.counterState.counterStatus == LoadingStatus.idle) {
        next(LoadingAddCounterAction());
        Timer(Duration(seconds: 1), () {
          int oldCount = store.state.counterState.counter.count;
          final Counter newCounter =
              store.state.counterState.counter.copyWith(count: oldCount + 1);
          next(UpdateCounterAction(newCounter));
        });
      }
    }
  }
}
