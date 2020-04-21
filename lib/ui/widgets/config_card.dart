import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterreduxbase/redux/app/app_state.dart';
import 'package:flutterreduxbase/viewmodels/pages/main_page_view_model.dart';
import 'package:flutterreduxbase/viewmodels/widgets/config_card_view_model.dart';
import 'package:random_color/random_color.dart';

class ConfigCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ConfigCardViewModel>(
      distinct: true,
      converter: (store) => MainPageViewModel.configCardViewModel(store),
      builder: (_, viewModel) => _ConfigCardContent(viewModel: viewModel),
    );
  }
}

class _ConfigCardContent extends StatelessWidget {
  final ConfigCardViewModel viewModel;

  const _ConfigCardContent({Key key, this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = RandomColor().randomColor();
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              viewModel.lang,
              style: TextStyle(
                color: color,
              ),
            ),
            Text(
              viewModel.url,
              style: TextStyle(
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
