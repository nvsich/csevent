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
      background: Container(
        color: Colors.red,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            )
          ],
        ),
      ),
      key: keyDismiss,
      direction: direction ?? DismissDirection.endToStart,
      onDismissed: (direction) => onDismissed?.call(direction),
      child: child,
    );
  }
}
