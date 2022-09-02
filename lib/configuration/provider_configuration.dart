import 'package:provider/provider.dart';

import '../application/temperature_conversion_store.dart';

final providers = [
  ChangeNotifierProvider(create: (_) => TemperatureConversionStore()),
];
