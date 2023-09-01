import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/core/presentation/widgets/custom_text.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.formField,
    required this.title,
  });
  final FormField formField;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabelText(title),
        formField,
      ],
    );
  }
}

class CustomTextFormField extends TextFormField {
  CustomTextFormField({
    super.key,
    required String? initialValue,
    required void Function(String)? onChanged,
    String placeHolder = 'Search',
  }) : super(
            initialValue: initialValue,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: placeHolder,
            ));
}

class CustomDropdownField<T> extends DropdownButtonFormField<T> {
  CustomDropdownField({
    super.key,
    required T value,
    required List<T> items,
    required void Function(T?)? onChanged,
    String placeHolder = 'Select',
  }) : super(
            value: value,
            items: items
                .map(
                  (e) => DropdownMenuItem<T>(
                    value: e,
                    child: Text(
                      e.toString(),
                    ),
                  ),
                )
                .toList(),
            onChanged: onChanged,
            decoration: InputDecoration(
              labelText: placeHolder,
            ));
}
