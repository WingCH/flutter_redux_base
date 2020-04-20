import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterreduxbase/models/loading_status.dart';
import 'package:flutterreduxbase/viewmodels/pages/main_page_view_model.dart';
import 'package:flutterreduxbase/viewmodels/widgets/counter_label_view_model.dart';
import 'package:random_color/random_color.dart';

import '../../redux/app/app_state.dart';

class CounterLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CounterLabelViewModel>(
      distinct: true,
      converter: (store) => MainPageViewModel.counterLabelViewModel(store),
      builder: (_, viewModel) => _CounterLabelContent(viewModel: viewModel),
    );
  }
}

class _CounterLabelContent extends StatelessWidget {
  final CounterLabelViewModel viewModel;

  const _CounterLabelContent({Key key, this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return viewModel.loadingStatus == LoadingStatus.loading
        ? CircularProgressIndicator()
        : Text(
            viewModel.counter.count.toString(),
            style: Theme.of(context).textTheme.display1.merge(
                  TextStyle(
                    color: RandomColor().randomColor(),
                  ),
                ),
          );
  }
}
