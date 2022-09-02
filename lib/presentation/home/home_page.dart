import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configuration/provider_configuration.dart';
import '../temperature/temperature_page.dart';
import 'widgets/background_image_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: providers,
        child: const Scaffold(
          body: BackgroundImageWidget(
            child: TemperaturePage(),
          ),
        ),
      );
}
