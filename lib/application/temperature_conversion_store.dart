import 'package:flutter/material.dart';

import '../domain/core/temperature_scale.dart';
import '../domain/temperature/temperature.dart';
import '../domain/temperature/temperature_value_objects.dart';

class TemperatureConversionStore extends ValueNotifier<Temperature> {
  TemperatureConversionStore() : super(Temperature.initial());

  void changeScale({required TemperatureScale to}) {
    final temperature = value;

    value = Temperature(
      value: TemperatureValueObjects(
        from: temperature.scale,
        to: to,
        value: temperature.value.getOrError(),
      ),
      scale: to,
    );
  }
}
