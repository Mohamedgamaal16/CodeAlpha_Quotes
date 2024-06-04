import 'package:flutter/material.dart';

extension IterableExt on Iterable<Widget> {
  Iterable<Widget> seperator(Widget elemnet) sync* {
    final iterator = this.iterator;
    if (iterator.moveNext()) {
      yield iterator.current;
      while (iterator.moveNext()) {
        yield elemnet;
        yield iterator.current;
      }
    }
  }
}
