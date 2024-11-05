// popup_widget.dart
import 'package:flutter/material.dart';

class PopupWidget extends StatelessWidget {
  final String message;

  const PopupWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            message,
            style: const TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
