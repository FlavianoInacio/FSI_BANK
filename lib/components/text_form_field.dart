import 'package:flutter/material.dart';

class TextFormFieldPerson extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final IconData icon;
  final FormFieldValidator<String> validator;
  final TextInputType inputType;
  final String hintText;

  TextFormFieldPerson({
    this.labelText,
    this.controller,
    this.icon,
    this.validator,
    this.inputType,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      validator: validator,
      controller: controller,
      style: TextStyle(fontSize: 24.0),
      decoration: InputDecoration(
        icon: icon != null ? Icon(icon) : null,
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}
