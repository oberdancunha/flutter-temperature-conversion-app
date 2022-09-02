import 'package:flutter_temperature_conversion_app/domain/core/temperature_scale.dart';
import 'package:flutter_temperature_conversion_app/domain/temperature/temperature_value_objects.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

void main() {
  group('Celsius |', () {
    const degreesInCelsius = 32.0;

    group('To Fahrenheit |', () {
      test('Should convert 32.0 degrees Celsius to 89.6 degrees Fahrenheit', () {
        final temperatureValueObjects = TemperatureValueObjects(
          from: TemperatureScale.celsius,
          to: TemperatureScale.fahrenheit,
          value: degreesInCelsius,
        );
        expect(temperatureValueObjects.value, isA<Right<void, double>>());
        expect(temperatureValueObjects.value, equals(right(89.6)));
        expect(temperatureValueObjects.getOrError(), equals(89.6));
      });
    });

    group('To Kelvin |', () {
      test('Should convert 32.0 degrees Celsius to 305.15 Kelvin', () {
        final temperatureValueObjects = TemperatureValueObjects(
          from: TemperatureScale.celsius,
          to: TemperatureScale.kelvin,
          value: degreesInCelsius,
        );
        expect(temperatureValueObjects.value, isA<Right<void, double>>());
        expect(temperatureValueObjects.value, equals(right(305.15)));
        expect(temperatureValueObjects.getOrError(), equals(305.15));
      });
    });

    group('Not change |', () {
      test('Should return the same degrees Celsius when there is no change', () {
        final temperatureValueObjects = TemperatureValueObjects(
          from: TemperatureScale.celsius,
          to: TemperatureScale.celsius,
          value: degreesInCelsius,
        );
        expect(temperatureValueObjects.value, isA<Right<void, double>>());
        expect(temperatureValueObjects.value, equals(right(degreesInCelsius)));
        expect(temperatureValueObjects.getOrError(), equals(degreesInCelsius));
      });
    });
  });

  group('Fahrenheit |', () {
    const degreesInFahrenheit = 89.6;

    group('To Celsius |', () {
      test('Should convert 89.6 degrees Fahrenheit to 32.0 degrees Celsius', () {
        final temperatureValueObjects = TemperatureValueObjects(
          from: TemperatureScale.fahrenheit,
          to: TemperatureScale.celsius,
          value: degreesInFahrenheit,
        );
        expect(temperatureValueObjects.value, isA<Right<void, double>>());
        expect(temperatureValueObjects.value, equals(right(32)));
        expect(temperatureValueObjects.getOrError(), equals(32));
      });
    });

    group('To Kelvin |', () {
      test('Should convert 89.6 degrees Fahrenheit to 305.15 Kelvin', () {
        final temperatureValueObjects = TemperatureValueObjects(
          from: TemperatureScale.fahrenheit,
          to: TemperatureScale.kelvin,
          value: degreesInFahrenheit,
        );
        expect(temperatureValueObjects.value, isA<Right<void, double>>());
        expect(temperatureValueObjects.value, equals(right(305.15)));
        expect(temperatureValueObjects.getOrError(), equals(305.15));
      });
    });

    group('Not change |', () {
      test('Should return the same degrees Fahrenheit when there is no change', () {
        final temperatureValueObjects = TemperatureValueObjects(
          from: TemperatureScale.fahrenheit,
          to: TemperatureScale.fahrenheit,
          value: degreesInFahrenheit,
        );
        expect(temperatureValueObjects.value, isA<Right<void, double>>());
        expect(temperatureValueObjects.value, equals(right(degreesInFahrenheit)));
        expect(temperatureValueObjects.getOrError(), equals(degreesInFahrenheit));
      });
    });
  });

  group('Kelvin |', () {
    const kelvin = 305.15;

    group('To Celsius |', () {
      test('Should convert 305.15 Kelvin to 32.0 degrees Celsius', () {
        final temperatureValueObjects = TemperatureValueObjects(
          from: TemperatureScale.kelvin,
          to: TemperatureScale.celsius,
          value: kelvin,
        );
        expect(temperatureValueObjects.value, isA<Right<void, double>>());
        expect(temperatureValueObjects.value, equals(right(32)));
        expect(temperatureValueObjects.getOrError(), equals(32));
      });
    });

    group('To Fahrenheit |', () {
      test('Should convert 305.15 Kelvin to 89.6 degrees Fahrenheit', () {
        final temperatureValueObjects = TemperatureValueObjects(
          from: TemperatureScale.kelvin,
          to: TemperatureScale.fahrenheit,
          value: kelvin,
        );
        expect(temperatureValueObjects.value, isA<Right<void, double>>());
        expect(temperatureValueObjects.value, equals(right(89.6)));
        expect(temperatureValueObjects.getOrError(), equals(89.6));
      });

      group('Not change |', () {
        test('Should return the same Kelvin when there is no change', () {
          final temperatureValueObjects = TemperatureValueObjects(
            from: TemperatureScale.kelvin,
            to: TemperatureScale.kelvin,
            value: kelvin,
          );
          expect(temperatureValueObjects.value, isA<Right<void, double>>());
          expect(temperatureValueObjects.value, equals(right(kelvin)));
          expect(temperatureValueObjects.getOrError(), equals(kelvin));
        });
      });
    });
  });
}
