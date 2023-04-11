import 'package:addict_tool/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class OnboardItemWidget extends StatelessWidget {
  const OnboardItemWidget(
      {Key? key,
      required this.image,
      required this.title,
      required this.message})
      : super(key: key);
  final String image;
  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          width: 309,
        ),
        const Spacer(),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 4,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyle.fontWeight500(fontSize: 24),
              ),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 6,
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: AppTextStyle.fontWeight400(
                    fontSize: 18, color: AppColor.secondaryAddict),
              ),
            ),
            const Spacer(),
          ],
        )
      ],
    );
  }
}
