import 'package:addict_tool/ui/extension_methods/context_extension.dart';
import 'package:addict_tool/ui/shared/svg_render_widget.dart';
import 'package:addict_tool/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class SocialButtonWidget extends StatelessWidget {
  const SocialButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _ButtonWidget(
          label: 'Facebook',
          color: context.primaryColor,
          svg: AssetPath.facebookSvg,
        ),
        const SizedBox(width: 16),
        _ButtonWidget(
          label: 'Google',
          color: context.errorColor,
          svg: AssetPath.googleSvg,
        )
      ],
    );
  }
}

class _ButtonWidget extends StatelessWidget {
  const _ButtonWidget(
      {Key? key,
      required this.label,
      required this.svg,
      required this.color,
      this.onTap})
      : super(key: key);
  final String label;
  final Color color;
  final String svg;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: color,
      child: Row(
        children: [
          SvgRenderWidget(svgPath: svg),
          const SizedBox(width: 5),
          Text(
            label,
            style: AppTextStyle.fontWeight500(color: AppColor.white),
          ),
        ],
      ),
    );
  }
}
