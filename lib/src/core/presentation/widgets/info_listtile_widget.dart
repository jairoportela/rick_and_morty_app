import 'package:flutter/material.dart';

class InfoListTile extends StatelessWidget {
  const InfoListTile({
    super.key,
    required this.info,
    required this.title,
  });
  final Widget info;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey.shade200,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: info,
    );
  }
}
