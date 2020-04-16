import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterreduxbase/redux/app/app_reducer.dart';
import 'package:flutterreduxbase/redux/app/app_state.dart';
import 'package:flutterreduxbase/redux/counter/counter_middleware.dart';
import 'package:flutterreduxbase/ui/pages/main_page.dart';
import 'package:flutterreduxbase/utils/keys.dart';
import 'package:flutterreduxbase/utils/routers.dart';
import 'package:redux/redux.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ReduxApp(
      store: Store<AppState>(
        appReducer,
        initialState: AppState.initial(),
        middleware: [
          CounterMiddleware(),
        ],
      ),
    ),
  );
}

class ReduxApp extends StatelessWidget {
  final Store<AppState> store;

  const ReduxApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: "Redux Example",
        navigatorKey: Keys.navigatorKey,
        routes: {
          Routes.home: (context) {
            return MainPage();
          },
        },
      ),
    );
  }
}
