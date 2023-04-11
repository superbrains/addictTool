import 'package:addict_tool/ui/extension_methods/context_extension.dart';
import 'package:addict_tool/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class OnboardHeaderWidget extends StatelessWidget {
  const OnboardHeaderWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashBorderPainter(context.primaryColor),
      child: Container(
        height: 250,
        width: double.maxFinite,
        child: Row(
          children: [
            const SizedBox(width: 16),
            Expanded(
                child: Text(
              title,
              style: AppTextStyle.fontWeight500(
                  fontSize: 24, color: AppColor.white),
            )),
            const Spacer()
          ],
        ),
      ),
    );
  }
}

class DashBorderPainter extends CustomPainter {
  final Color color;

  DashBorderPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, height)
      ..lineTo(width, height * 0.6)
      ..lineTo(width, 0)
      ..lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
