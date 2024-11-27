import 'package:flutter/material.dart';

class MapView extends StatelessWidget {
  const MapView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * (2 / 3),
      child: Image.asset(
        'assets/map.png',
        fit: BoxFit.cover,
      ),
    );
  }
}