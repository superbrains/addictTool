import 'package:flutter/material.dart';

/// Apply padding symmetrically, mostly used as a child of [Scaffold]
class PaddedContainer extends StatelessWidget {
  final double horizontalPadding;
  final double verticalPadding;
  final Widget? child;
  final Alignment alignment;
  final Color? color;

  const PaddedContainer({
    Key? key,
    this.horizontalPadding = 16.0,
    this.verticalPadding = 0,
    @required this.child,
    this.alignment = Alignment.topLeft,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: color,
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),
        alignment: alignment,
        child: child,
      ),
    );
  }
}
