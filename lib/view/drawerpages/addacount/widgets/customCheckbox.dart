import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final bool value;
  final String conent;
  final bool isactive;
  const CustomCheckBox(
      {super.key,
      required this.value,
      required this.conent,
      this.isactive = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Icon(Icons.circle_outlined),
        Checkbox(
          checkColor: Colors.white,
          // fillColor: MaterialStateProperty.resolveWith(getColor),
          value: value,
          shape: CircleBorder(),
          onChanged: (bool? value) {},
        ),
        Text(
          "$conent",
          style: TextStyle(color: isactive ? Colors.black : Colors.grey),
        )
      ],
    );
  }
}
