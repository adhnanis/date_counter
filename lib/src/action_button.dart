import 'package:flutter/material.dart';

import 'my_colors.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, required this.buttonText, required this.onChange});

  final String buttonText;
  final VoidCallback onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderGray, width: 1)),
      child: Center(
        child: TextButton(
            onPressed: () => onChange(),
            child: Text(
              buttonText,
              style: const TextStyle(fontSize: 20),
            )),
      ),
    );
  }
}
