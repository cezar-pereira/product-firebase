import 'package:flutter/material.dart';

class TextFormFieldComponent extends StatelessWidget {
  const TextFormFieldComponent(
      {Key? key,
      required this.hint,
      this.keyboardType = TextInputType.text,
      required this.controller,
      this.validation})
      : super(key: key);
  final String hint;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Function? validation;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(hint, style: Theme.of(context).textTheme.bodyText1),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          validator: validation != null ? (value) => validation!(value) : null,
          keyboardType: keyboardType,
          decoration: InputDecoration(hintText: hint),
        ),
      ],
    );
  }
}
