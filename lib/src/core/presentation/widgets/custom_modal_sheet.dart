import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/core/presentation/widgets/custom_text.dart';

class CustomModalBottomSheet extends StatelessWidget {
  const CustomModalBottomSheet({
    super.key,
    required this.children,
    required this.title,
  });
  final List<Widget> children;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: const EdgeInsets.all(15).copyWith(bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [TitleText(title), ...children],
        ),
      ),
    );
  }
}
