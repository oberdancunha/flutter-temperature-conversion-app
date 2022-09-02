import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../application/temperature_conversion_store.dart';
import '../../../domain/core/temperature_scale.dart';

class TemperatureChooseScaleWidget extends StatelessWidget {
  final TemperatureScale scaleChoosed;

  const TemperatureChooseScaleWidget({
    required this.scaleChoosed,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: TemperatureScale.values.length,
        itemBuilder: (_, index) => ListTile(
          title: SizedBox(
            child: Text(TemperatureScale.values.elementAt(index).scaleName),
          ),
          leading: Radio<TemperatureScale>(
            value: TemperatureScale.values.elementAt(index),
            groupValue: scaleChoosed,
            onChanged: (scaleChanged) =>
                context.read<TemperatureConversionStore>().changeScale(to: scaleChanged!),
          ),
        ),
      );
}
