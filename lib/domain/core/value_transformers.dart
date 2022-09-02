import 'package:fpdart/fpdart.dart';

import 'temperature_scale.dart';

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
  final degreesInFahrenheit = (degreesInCelsius * 1.8) + 32;

  return double.parse(degreesInFahrenheit.toStringAsFixed(2));
}

double _convertCelsiusToKelvin(double degreesInCelsius) {
  final kelvin = degreesInCelsius + 273.15;

  return kelvin;
}

double _convertFahrenheitToCelsius(double degreesInFahrenheit) {
  final degreesInCelsius = (degreesInFahrenheit - 32) / 1.8;

  return degreesInCelsius.roundToDouble();
}

double _convertFahrenheitToKelvin(double degreesInFahrenheit) {
  final kelvin = (degreesInFahrenheit + 459.67) * (5 / 9);

  return double.parse(kelvin.toStringAsFixed(2));
}

double _convertKelvinToCelsius(double kelvin) {
  final degreesInCelsius = kelvin - 273.15;

  return degreesInCelsius;
}

double _convertKelvinToFahrenheit(double kelvin) {
  final degreesInFahrenheit = ((kelvin - 273.15) * 9 / 5) + 32;

  return degreesInFahrenheit;
}
