import 'package:flutter/material.dart';

import '../../../domain/temperature/temperature.dart';

class TemperatureValueWidget extends StatelessWidget {
  final Temperature temperature;

  const TemperatureValueWidget({
    required this.temperature,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        child: Center(
          child: Text(
            "${temperature.value.getOrError().toString()}${temperature.scale.scaleSymbol}",
          ),
        ),
      );
}
