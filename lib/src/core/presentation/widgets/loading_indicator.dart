import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key, this.strokeWidth = 4.0});
  final double strokeWidth;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
      ),
    );
  }
}
