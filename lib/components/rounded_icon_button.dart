import 'package:flutter/material.dart';
class RoundedIconButton extends StatelessWidget {
  RoundedIconButton(this.child, this.func);
  final Widget child;
  final Function func;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        func();
      },
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: Color(0xff8d8e98),
      elevation: 12,
      focusElevation: 8,
      hoverElevation: 10,
      child: child,
    );
  }
}