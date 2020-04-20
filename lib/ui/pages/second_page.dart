import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterreduxbase/redux/app/app_state.dart';
import 'package:flutterreduxbase/ui/widgets/counter_card.dart';
import 'package:flutterreduxbase/viewmodels/pages/second_page_view_model.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SecondPageViewModel>(
      distinct: true,
      converter: (store) => SecondPageViewModel.fromStore(store),
      builder: (_, viewModel) {
        return _SecondPageContent(viewModel: viewModel);
      },
    );
  }
}

class _SecondPageContent extends StatelessWidget {
  final SecondPageViewModel viewModel;

  const _SecondPageContent({Key key, this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
        // hide back button on appbar
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "goToMainPage",
        onPressed: viewModel.goToMainPage,
        tooltip: 'goToMainPage',
        child: Icon(Icons.arrow_back),
      ),
      body: Center(
        child: CounterCard(),
      ),
    );
  }
}
