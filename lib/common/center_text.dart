import 'package:flutter/material.dart';
import 'package:payments_history/models/text_config.dart';

class CenterText extends StatelessWidget {
  const CenterText({Key? key, required this.configuration, required this.text}) : super(key: key);

  final TextConfiguration configuration;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text,
        style: TextStyle(
          color: Color(configuration.color),
          fontFamily: 'Roboto',
          fontSize: configuration.size,
          fontWeight: configuration.isBold ? FontWeight.bold : FontWeight.normal
        ),
      ),
    );
  }
}
