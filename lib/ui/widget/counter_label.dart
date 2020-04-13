import 'package:flutter/material.dart';

class CounterLabel extends StatelessWidget {
  final int counter;

  const CounterLabel({Key key, this.counter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      counter.toString(),
      style: Theme.of(context).textTheme.display1,
    );
  }
}
