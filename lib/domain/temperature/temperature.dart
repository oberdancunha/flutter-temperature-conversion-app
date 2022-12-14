import 'dart:math';

import 'package:equatable/equatable.dart';

import '../core/temperature_scale.dart';
import 'temperature_value_objects.dart';

class Temperature extends Equatable {
  final TemperatureIdValueObjects id;
  final TemperatureValueObjects value;
  final TemperatureScale scale;

  const Temperature({
    required this.id,
    required this.value,
    required this.scale,
  });

  @override
  List<Object> get props => [value, scale];

  factory Temperature.initial() => Temperature(
        id: TemperatureIdValueObjects(),
        value: TemperatureValueObjects(
          from: TemperatureScale.celsius,
          to: TemperatureScale.celsius,
          value: Random().nextBool()
              ? Random().nextInt(89).toDouble() * -1
              : Random().nextInt(57).toDouble(),
        ),
        scale: TemperatureScale.celsius,
      );
}
