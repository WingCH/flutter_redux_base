import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterreduxbase/redux/app/app_state.dart';
import 'package:flutterreduxbase/ui/widgets/config_card.dart';
import 'package:flutterreduxbase/ui/widgets/counter_label.dart';
import 'package:flutterreduxbase/viewmodels/pages/main_page_view_model.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MainPageViewModel>(
      rebuildOnChange: false,
      converter: (store) => MainPageViewModel.fromStore(store),
      builder: (_, viewModel) {
        return _MainPageContent(viewModel: viewModel);
      },
    );
  }
}

class _MainPageContent extends StatelessWidget {
  final MainPageViewModel viewModel;

  const _MainPageContent({Key key, this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Redux Example'),
        centerTitle: true,
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "goToSecondPage",
            onPressed: viewModel.goToSecondPage,
            tooltip: 'goToSecondPage',
            child: Icon(Icons.arrow_forward),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "Increment",
            onPressed: viewModel.addCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          ConfigCard(),
          RaisedButton(
            child: Text(
              'Change config',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blueGrey,
            onPressed: viewModel.updateConfig,
          ),
          Expanded(
            child: Center(
              child: CounterLabel(),
            ),
          ),
        ],
      ),
    );
  }
}
