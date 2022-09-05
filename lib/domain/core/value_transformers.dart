import 'package:fpdart/fpdart.dart';

import 'temperature_scale.dart';

const fahrenheitWaterFreezes = 32;
const fahrenheitScale = 1.8;
const kelvinAbsoluteZero = 273.15;
const kelvinZeroToFahrenheit = 459.67;
const kelvinToFahrenheitScale = 5 / 9;

Either<void, double> convertTemperature({
  required TemperatureScale from,
  required TemperatureScale to,
  required double value,
}) {
  switch (from) {
    case TemperatureScale.celsius:
      switch (to) {
        case TemperatureScale.fahrenheit:
          return right(_convertCelsiusToFahrenheit(value));
        case TemperatureScale.kelvin:
          return right(_convertCelsiusToKelvin(value));
        case TemperatureScale.celsius:
          return right(value);
      }
    case TemperatureScale.fahrenheit:
      switch (to) {
        case TemperatureScale.celsius:
          return right(_convertFahrenheitToCelsius(value));
        case TemperatureScale.kelvin:
          return right(_convertFahrenheitToKelvin(value));
        case TemperatureScale.fahrenheit:
          return right(value);
      }
    case TemperatureScale.kelvin:
      switch (to) {
        case TemperatureScale.celsius:
          return right(_convertKelvinToCelsius(value));
        case TemperatureScale.fahrenheit:
          return right(_convertKelvinToFahrenheit(value));
        case TemperatureScale.kelvin:
          return right(value);
      }
  }
}

double _convertCelsiusToFahrenheit(double degreesInCelsius) {
  final degreesInFahrenheit = (degreesInCelsius * fahrenheitScale) + fahrenheitWaterFreezes;

  return double.parse(degreesInFahrenheit.toStringAsFixed(2));
}

double _convertCelsiusToKelvin(double degreesInCelsius) {
  final kelvin = degreesInCelsius + kelvinAbsoluteZero;

  return kelvin;
}

double _convertFahrenheitToCelsius(double degreesInFahrenheit) {
  final degreesInCelsius = (degreesInFahrenheit - fahrenheitWaterFreezes) / fahrenheitScale;

  return degreesInCelsius.roundToDouble();
}

double _convertFahrenheitToKelvin(double degreesInFahrenheit) {
  final kelvin = (degreesInFahrenheit + kelvinZeroToFahrenheit) * kelvinToFahrenheitScale;

  return double.parse(kelvin.toStringAsFixed(2));
}

double _convertKelvinToCelsius(double kelvin) {
  final degreesInCelsius = kelvin - kelvinAbsoluteZero;

  return degreesInCelsius;
}

double _convertKelvinToFahrenheit(double kelvin) {
  final degreesInFahrenheit =
      ((kelvin - kelvinAbsoluteZero) * fahrenheitScale) + fahrenheitWaterFreezes;

  return degreesInFahrenheit;
}
