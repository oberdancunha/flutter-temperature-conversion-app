import 'package:flutter_temperature_conversion_app/domain/core/temperature_scale.dart';
import 'package:flutter_temperature_conversion_app/domain/core/value_transformers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

void main() {
  group('Celsius |', () {
    const degreesInCelsius = 25.0;

    group('To Fahrenheit |', () {
      test('Should convert 25.0 degrees Celsius to 77.0 degrees Fahrenheit', () {
        final degreesInFahrenheit = convertTemperature(
          from: TemperatureScale.celsius,
          to: TemperatureScale.fahrenheit,
          value: degreesInCelsius,
        );
        expect(degreesInFahrenheit, isA<Right<void, double>>());
        expect(degreesInFahrenheit, equals(right(77)));
      });
    });

    group('To Kelvin |', () {
      test('Should convert 25.0 degrees Celsius to 298.15 Kelvin', () {
        final kelvin = convertTemperature(
          from: TemperatureScale.celsius,
          to: TemperatureScale.kelvin,
          value: degreesInCelsius,
        );
        expect(kelvin, isA<Right<void, double>>());
        expect(kelvin, equals(right(298.15)));
      });
    });

    group('Not change |', () {
      test('Should return the same degrees Celsius when there is no change', () {
        final notChangeDegrees = convertTemperature(
          from: TemperatureScale.celsius,
          to: TemperatureScale.celsius,
          value: degreesInCelsius,
        );
        expect(notChangeDegrees, isA<Right<void, double>>());
        expect(notChangeDegrees, equals(right(degreesInCelsius)));
      });
    });
  });

  group('Fahrenheit |', () {
    const degreesInFahrenheit = 77.0;

    group('To Celsius |', () {
      test('Should convert 77.0 degrees Fahrenheit to 25.0 degrees Celsius', () {
        final degreesInCelsius = convertTemperature(
          from: TemperatureScale.fahrenheit,
          to: TemperatureScale.celsius,
          value: degreesInFahrenheit,
        );
        expect(degreesInCelsius, isA<Right<void, double>>());
        expect(degreesInCelsius, equals(right(25)));
      });
    });

    group('To Kelvin |', () {
      test('Should convert 77.0 degrees Fahrenheit to 298.15 Kelvin', () {
        final kelvin = convertTemperature(
          from: TemperatureScale.fahrenheit,
          to: TemperatureScale.kelvin,
          value: degreesInFahrenheit,
        );
        expect(kelvin, isA<Right<void, double>>());
        expect(kelvin, equals(right(298.15)));
      });
    });

    group('Not change |', () {
      test('Should return the same degrees Fahrenheit when there is no change', () {
        final notChangeDegrees = convertTemperature(
          from: TemperatureScale.fahrenheit,
          to: TemperatureScale.fahrenheit,
          value: degreesInFahrenheit,
        );
        expect(notChangeDegrees, isA<Right<void, double>>());
        expect(notChangeDegrees, equals(right(degreesInFahrenheit)));
      });
    });
  });

  group('Kelvin |', () {
    const kelvin = 298.15;

    group('To Celsius |', () {
      test('Should convert 298.15 Kelvin to 25.0 degrees Celsius', () {
        final degreesInCelsius = convertTemperature(
          from: TemperatureScale.kelvin,
          to: TemperatureScale.celsius,
          value: kelvin,
        );
        expect(degreesInCelsius, isA<Right<void, double>>());
        expect(degreesInCelsius, equals(right(25)));
      });
    });

    group('To Fahrenheit |', () {
      test('Should convert 298.15 Kelvin to 77.0 degrees Fahrenheit', () {
        final degreesInFahrenheit = convertTemperature(
          from: TemperatureScale.kelvin,
          to: TemperatureScale.fahrenheit,
          value: kelvin,
        );
        expect(degreesInFahrenheit, isA<Right<void, double>>());
        expect(degreesInFahrenheit, equals(right(77)));
      });
    });

    group('Not change |', () {
      test('Should return the same Kelvin when there is no change', () {
        final notChangeKelvin = convertTemperature(
          from: TemperatureScale.kelvin,
          to: TemperatureScale.kelvin,
          value: kelvin,
        );
        expect(notChangeKelvin, isA<Right<void, double>>());
        expect(notChangeKelvin, equals(right(kelvin)));
      });
    });
  });
}
