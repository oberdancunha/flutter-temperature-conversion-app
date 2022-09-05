import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';

import '../temperature/temperature_value_objects.dart';

@immutable
abstract class ValueObjects {
  Either<void, double> get value;

  double getOrError() => value.getRight().getOrElse(() => throw Error);

  @override
  bool operator ==(covariant TemperatureValueObjects other) {
    if (identical(this, other)) {
      return true;
    }

    return other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}
