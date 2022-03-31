import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text(title ?? 'Confirm?')),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: const Text(
            'Confirm',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Cancel',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ],
      actionsAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}
