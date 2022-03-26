import 'package:flutter/material.dart';

class TabWidget extends StatelessWidget {
  final String label;
  const TabWidget({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        label,
        textScaleFactor: MediaQuery.of(context).textScaleFactor.clamp(0.5, 0.5),
      ),
    );
  }
}
