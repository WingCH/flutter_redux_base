import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterreduxbase/models/loading_status.dart';
import 'package:flutterreduxbase/redux/app/app_state.dart';
import 'package:flutterreduxbase/ui/widgets/counter_label.dart';
import 'package:flutterreduxbase/viewmodels/pages/main_page_view_model.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MainPageViewModel>(
      distinct: true,
      converter: (store) => MainPageViewModel.fromStore(store),
      builder: (_, viewModel) => _MainPageContent(viewModel: viewModel),
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
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.addCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      body: Center(
        child: viewModel.status == LoadingStatus.loading
            ? CircularProgressIndicator()
            : CounterLabel(),
      ),
    );
  }
}
