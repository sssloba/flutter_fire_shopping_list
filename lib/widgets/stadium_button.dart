import 'package:flutter/material.dart';

class StadimButton extends StatelessWidget {
  const StadimButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);
  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(const StadiumBorder())),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
