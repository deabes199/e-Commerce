import 'package:flutter/material.dart';
import 'package:hero_store_app/core/theming/text_style.dart';

class AppCustomButton extends StatelessWidget {
  const AppCustomButton(
      {super.key,
      required this.label,
      this.ontap,
      this.height = 60,
      this.width = double.infinity,
      this.color = Colors.white});
  final String label;
  final void Function()? ontap;
  final double? height, width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: color),
          onPressed: ontap,
          child: Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
        ));
  }
}
