enum TemperatureScale {
  celsius('Celsius', '° C'),
  fahrenheit('Fahrenheit', '° F'),
  kelvin('Kelvin', ' K');

  final String scaleName;
  final String scaleSymbol;

  const TemperatureScale(this.scaleName, this.scaleSymbol);
}
