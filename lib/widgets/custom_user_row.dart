import 'package:flutter/material.dart';

class CustomUserRow extends StatelessWidget {
  const CustomUserRow({
    Key? key,
    required this.text,
    required this.textData,
  }) : super(key: key);

  final String text;
  final String textData;

  @override
  Widget build(BuildContext context) {
    const TextStyle _idTextStyle =
        TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    const TextStyle _textStyle = TextStyle(fontSize: 14);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: _idTextStyle,
        ),
        Expanded(
          child: Text(
            textData,
            style: _textStyle,
          ),
        ),
      ],
    );
  }
}
