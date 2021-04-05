import 'package:flutter/material.dart';

  class ElevateButtonCustom extends StatelessWidget {
  final VoidCallback onclickButton;
  final bool valueCircular;
  final String descriccao;

  ElevateButtonCustom({
    @required this.onclickButton,
    @required this.valueCircular,
    @required this.descriccao,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onclickButton,
      child: valueCircular
          ? CircularProgressIndicator(
              backgroundColor: Colors.white,
            )
          : Text(
              descriccao,
              style: TextStyle(fontSize: 24.0),
            ),
    );
  }
}
