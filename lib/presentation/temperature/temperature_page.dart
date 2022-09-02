import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../application/temperature_conversion_store.dart';
import 'widgets/temperature_choose_scale_widget.dart';
import 'widgets/temperature_value_widget.dart';

class TemperaturePage extends StatelessWidget {
  const TemperaturePage({super.key});

  @override
  Widget build(BuildContext context) {
    final temperatureConversionStore = context.watch<TemperatureConversionStore>();
    final temperature = temperatureConversionStore.value;

    return Column(
      children: [
        TemperatureValueWidget(temperature: temperature),
        Expanded(
          child: TemperatureChooseScaleWidget(
            scaleChoosed: temperature.scale,
          ),
        ),
      ],
    );
  }
}
