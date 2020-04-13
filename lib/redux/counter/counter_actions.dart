import 'package:flutterreduxbase/models/counter.dart';

class LoadingAddCounterAction {}

class AddCounterAction {}

class UpdateCounterAction {
  final Counter counter;

  UpdateCounterAction(this.counter);
}
