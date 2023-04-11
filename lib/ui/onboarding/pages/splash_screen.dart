import 'package:addict_tool/ui/extension_methods/context_extension.dart';
import 'package:addict_tool/ui/route_names.dart';
import 'package:addict_tool/ui/shared/svg_render_widget.dart';
import 'package:addict_tool/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1),
        () => context.pushReplacementNamed(RouteNames.onboardingScreen));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: FractionalOffset.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xff1042EF), Color(0xff091A54)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          //image: DecorationImage(image: AssetImage(AssetPath.addictPath)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'AddicTool',
              style: AppTextStyle.fontWeight400(
                  color: AppColor.white, fontSize: 36),
            ),
            const SizedBox(width: 14),
            const SvgRenderWidget(
              svgPath: AssetPath.spannerSvg,
            )
          ],
        ),
      ),
    );
  }
}
