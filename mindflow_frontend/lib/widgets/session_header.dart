import 'package:flutter/material.dart';
import 'package:mindflow_frontend/styles.dart';

class SessionHeader extends StatelessWidget {
  const SessionHeader({
    super.key,
    required this.button1_title,
    required this.button2_title,
    required this.header_title,
    required this.button1_func,
    required this.button2_func,
  });

  final String button1_title;
  final String button2_title;
  final String header_title;

  final Function() button1_func;
  final Function() button2_func;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MaterialButton(
            padding: EdgeInsets.zero,
            onPressed: button1_func,
            child: Text(button1_title, style: button1),
          ),
          Text(header_title, style: heading2),
          MaterialButton(
            padding: EdgeInsets.zero,
            onPressed: button2_func,
            child: Text(button2_title, style: button1),
          )
        ],
      ),
    );
  }
}
