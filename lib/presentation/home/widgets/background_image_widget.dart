import 'package:flutter/material.dart';

class BackgroundImageWidget extends StatelessWidget {
  final Widget child;

  const BackgroundImageWidget({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(
              'assets/images/sky.png',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.75),
              BlendMode.darken,
            ),
          ),
        ),
        child: child,
      );
}
