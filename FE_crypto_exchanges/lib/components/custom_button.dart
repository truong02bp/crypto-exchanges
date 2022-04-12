import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget child;
  final double? width;
  final Color? color;

  const CustomButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.width,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 30,
      height: 30,
      child: RawMaterialButton(
        elevation: 0,
        fillColor: color ?? Theme.of(context).scaffoldBackgroundColor,
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
