import 'package:fpdart/fpdart.dart';
import 'package:uuid/uuid.dart';

import '../core/temperature_scale.dart';
import '../core/value_objects.dart';
import '../core/value_transformers.dart';

class TemperatureValueObjects extends ValueObjects<double> {
  @override
  final Either<void, double> value;

  factory TemperatureValueObjects({
    required TemperatureScale from,
    required TemperatureScale to,
    required double value,
  }) =>
      TemperatureValueObjects._(
        convertTemperature(
          from: from,
          to: to,
          value: value,
        ),
      );

  TemperatureValueObjects._(this.value);
}

class TemperatureIdValueObjects extends ValueObjects<String> {
  @override
  final Either<void, String> value;

  factory TemperatureIdValueObjects() => TemperatureIdValueObjects._(
        right(const Uuid().v1()),
      );

  TemperatureIdValueObjects._(this.value);
}
