import 'package:flutter_temperature_conversion_app/application/temperature_conversion_store.dart';
import 'package:flutter_temperature_conversion_app/domain/core/temperature_scale.dart';
import 'package:flutter_temperature_conversion_app/domain/temperature/temperature.dart';
import 'package:flutter_temperature_conversion_app/domain/temperature/temperature_value_objects.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:value_listenable_test/value_listenable_test.dart';

void main() {
  late TemperatureConversionStore temperatureConversionStore;
  late Temperature temperature;

  setUp(() {
    temperatureConversionStore = TemperatureConversionStore();
    temperature = temperatureConversionStore.value;
  });

  test('Should verify initial state', () {
    expect(temperature.scale, equals(TemperatureScale.celsius));
    expect(temperature.value.getOrError(), greaterThanOrEqualTo(0));
    expect(temperature.value.getOrError(), lessThanOrEqualTo(57));
  });

  valueListenableTest<TemperatureConversionStore>(
    'Should change scale from Celsius to Fahrenheit',
    build: () => temperatureConversionStore,
    act: (store) => store.changeScale(to: TemperatureScale.fahrenheit),
    expect: () => [
      Temperature(
        value: TemperatureValueObjects(
          from: TemperatureScale.celsius,
          to: TemperatureScale.fahrenheit,
          value: temperature.value.getOrError(),
        ),
        scale: TemperatureScale.fahrenheit,
      ),
    ],
  );

  tearDown(() {
    temperatureConversionStore.dispose();
  });
}
