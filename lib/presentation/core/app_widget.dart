import 'package:flutter/material.dart';

import '../home/home_page.dart';
import '../theme/theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'TConversion',
        debugShowCheckedModeBanner: false,
        theme: themeData,
        home: const HomePage(),
      );
}
