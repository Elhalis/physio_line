import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegionPointer extends StatelessWidget {
  const RegionPointer({
    super.key,
    required this.path,
    required this.top,
    required this.left,
    this.isEnabled = true,
  });
  final String path;
  final double top;
  final double left;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: IconButton(
        onPressed: isEnabled
            ? () {
                context.push(path);
              }
            : null,
        hoverColor: isEnabled ? Color.fromARGB(38, 236, 42, 20) : null,
        icon: Icon(
          isEnabled ? Icons.circle : Icons.lock,
          color: isEnabled ? Colors.black54 : Colors.grey,
          size: 19,
        ),
      ),
    );
  }
}
