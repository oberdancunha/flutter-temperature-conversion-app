import 'package:flutter_temperature_conversion_app/application/temperature_conversion_store.dart';
import 'package:flutter_temperature_conversion_app/domain/core/temperature_scale.dart';
import 'package:flutter_temperature_conversion_app/domain/temperature/temperature.dart';
import 'package:flutter_temperature_conversion_app/domain/temperature/temperature_value_objects.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:value_listenable_test/value_listenable_test.dart';

void main() {
  late TemperatureConversionStore temperatureConversionStore;

  setUp(() {
    temperatureConversionStore = TemperatureConversionStore();
  });

  test('Should verify initial state', () {
    expect(temperatureConversionStore.value.scale, equals(TemperatureScale.celsius));
    expect(temperatureConversionStore.value.value.getOrError(), greaterThanOrEqualTo(0));
    expect(temperatureConversionStore.value.value.getOrError(), lessThanOrEqualTo(57));
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
          value: temperatureConversionStore.value.value.getOrError(),
        ),
        scale: TemperatureScale.fahrenheit,
      ),
    ],
  );

  tearDown(() {
    temperatureConversionStore.dispose();
  });
}
