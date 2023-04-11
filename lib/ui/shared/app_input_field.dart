import 'package:addict_tool/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class AppInputField extends StatelessWidget {
  const AppInputField({Key? key, required this.title, required this.child})
      : super(key: key);

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.fontWeight400(
              color: const Color(0xffA6A6AA), fontSize: 14),
        ),
        const SizedBox(height: 2),
        child
      ],
    );
  }
}
