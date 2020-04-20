import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterreduxbase/redux/app/app_state.dart';
import 'package:flutterreduxbase/ui/widgets/counter_label.dart';
import 'package:flutterreduxbase/viewmodels/pages/second_page_view_model.dart';
import 'package:flutterreduxbase/viewmodels/widgets/counter_card_view_model.dart';

class CounterCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CounterCardViewModel>(
      distinct: true,
      converter: (store) => SecondPageViewModel.counterCardViewModel(store),
      builder: (_, viewModel) => _CounterCardContent(viewModel: viewModel),
    );
  }
}

class _CounterCardContent extends StatelessWidget {
  final CounterCardViewModel viewModel;

  const _CounterCardContent({Key key, this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CounterLabel(),
            SizedBox(
              height: 5,
            ),
            RaisedButton(
              child: Text(
                'add',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blueGrey,
              onPressed: viewModel.addCounter,
            ),
          ],
        ),
      ),
    );
  }
}
