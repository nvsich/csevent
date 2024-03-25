import 'package:flutter/material.dart';

class CustomDismissibleWidget extends StatelessWidget {
  const CustomDismissibleWidget({
    super.key,
    required this.keyDismiss,
    required this.direction,
    required this.onDismissed,
    required this.child,
  });

  final Key keyDismiss;
  final DismissDirection? direction;
  final Function(DismissDirection)? onDismissed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: keyDismiss,
      direction: direction ?? DismissDirection.endToStart,
      onDismissed: (_) => onDismissed,
      child: child,
    );
  }
}
