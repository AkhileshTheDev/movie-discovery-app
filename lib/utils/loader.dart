import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

dialogLoader(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    barrierColor: Colors.white.withOpacity(0.3),
    context: context,
    builder: (context) {
      return const SpinKitDoubleBounce(
        size: 60,
        color: Colors.purple,
      );
    },
  );
}

simpleLoader() {
  return const Center(
    child: SpinKitDoubleBounce(
      size: 60,
      color: Colors.purple,
    ),
  );
}
