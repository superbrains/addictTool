import 'package:addict_tool/ui/extension_methods/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PageViewDotIndicator extends HookWidget {
  const PageViewDotIndicator(
      {Key? key,
      required this.pageController,
      this.totalItem = 0,
      this.kActiveColor,
      this.kInactiveColor})
      : super(key: key);
  final PageController pageController;
  final int totalItem;
  final Color? kActiveColor;
  final Color? kInactiveColor;

  @override
  Widget build(BuildContext context) {
    final pageIndex = useListenableSelector(pageController,
        () => pageController.page?.round() ?? pageController.initialPage);
    final activeColor = kActiveColor ?? context.primaryColor;
    final inactiveColor = kInactiveColor ?? context.scaffoldBackgroundColor;
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < totalItem; i++)
          Container(
            height: 20,
            width: 20,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: i == pageIndex ? activeColor : inactiveColor,
                border: Border.all(color: context.primaryColor)),
          )
      ],
    );
  }
}
