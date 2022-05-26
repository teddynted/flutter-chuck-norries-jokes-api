import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final double left;
  final double top;
  final double bottom;
  final double right;
  final Color? primary;
  final double? fontSize;
  final String? text;
  final Color? color;
  final VoidCallback? onPressed;
  final Widget faIcon;
  final String? textDirection;
  final double horizontal;
  final double vertical;
  const Button(
      {Key? key,
      this.bottom = 0,
      this.left = 0,
      this.right = 0,
      this.top = 0,
      this.primary,
      this.fontSize = 15,
      this.text,
      this.color,
      this.onPressed,
      this.textDirection,
      required this.faIcon,
      required this.horizontal,
      required this.vertical})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(left: left, right: right, bottom: bottom, top: top),
        child: Directionality(
            textDirection:
                textDirection == 'rtl' ? TextDirection.rtl : TextDirection.ltr,
            child: ElevatedButton.icon(
              onPressed: onPressed,
              icon: faIcon,
              label: Text(text!,
                  style: TextStyle(
                    color: color,
                  )),
              style: ElevatedButton.styleFrom(
                  primary: primary,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                  textStyle: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
            )));
  }
}
