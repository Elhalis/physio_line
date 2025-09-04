import 'package:flutter/material.dart';

class CutDivider extends StatelessWidget {
  const CutDivider({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey, thickness: 1)),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(child: Divider(color: Colors.grey, thickness: 1)),
      ],
    );
  }
}
