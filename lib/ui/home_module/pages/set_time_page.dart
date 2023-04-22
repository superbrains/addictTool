import 'package:addict_tool/ui/extension_methods/context_extension.dart';
import 'package:addict_tool/ui/shared/app_elevated_button.dart';
import 'package:addict_tool/ui/shared/padded_container.dart';
import 'package:addict_tool/ui/shared/svg_render_widget.dart';
import 'package:addict_tool/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:installed_apps/app_info.dart';

class SetTimeOutPage extends HookWidget {
  const SetTimeOutPage({Key? key, required this.app}) : super(key: key);
  final AppInfo app;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController()..text = '1000';

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.scaffoldBackgroundColor,
        iconTheme: const IconThemeData(color: AppColor.secondaryAddict),
      ),
      body: PaddedContainer(
        horizontalPadding: 20,
        child: Column(
          children: [
            const SizedBox(height: 22),
            Row(
              children: [
                if (app.icon != null)
                  Image.memory(
                    app.icon!,
                    height: 22,
                    width: 22,
                  ),
                const SizedBox(width: 4),
                Text(
                  app.name ?? '',
                  style: AppTextStyle.fontWeight400(),
                ),
              ],
            ),
            const SvgRenderWidget(svgPath: AssetPath.timeoutSvg),
            Text('Set Timeout',
                style: AppTextStyle.fontWeight300(fontSize: 48)),
            Text('In Mins',
                style: AppTextStyle.fontWeight500(
                    color: AppColor.secondaryAddict)),
            const SizedBox(height: 40),
            Stack(
              children: [
                Opacity(
                  opacity: 0,
                  child: TextField(
                    controller: controller,
                    // autofocus: true,
                    keyboardType: TextInputType.number,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          color: const Color(0xffF8F7FA),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColor.iconFontColor)),
                      child: Text(
                        '',
                        style: AppTextStyle.fontWeight300(fontSize: 48),
                      ),
                    )),
                    const SizedBox(width: 8),
                    Expanded(
                        child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          color: const Color(0xffF8F7FA),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColor.iconFontColor)),
                    )),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.0),
                      child: SvgRenderWidget(svgPath: AssetPath.dotSvg),
                    ),
                    Expanded(
                        child: Container(
                      height: 70,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color(0xffF8F7FA),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColor.iconFontColor)),
                      child: Text(
                        '0',
                        style: AppTextStyle.fontWeight300(fontSize: 48),
                      ),
                    )),
                    const SizedBox(width: 8),
                    Expanded(
                        child: Container(
                      height: 70,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color(0xffF8F7FA),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColor.iconFontColor)),
                      child: Text(
                        '0',
                        style: AppTextStyle.fontWeight300(fontSize: 48),
                      ),
                    )),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Text('Repeat',
                    style: AppTextStyle.fontWeight400(
                        color: const Color(0xff333334))),
                const SizedBox(width: 30),
                ...['S', 'M', 'T', 'W', 'T', 'F', 'S'].map((e) => Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color(0xffF8F7FA),
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColor.iconFontColor)),
                      child: Text(
                        e,
                        style: AppTextStyle.fontWeight400(
                            color: const Color(0xff333334)),
                      ),
                    ))
              ],
            ),
            const SizedBox(height: 30),
            AppElevatedButton(label: 'Done', onPressed: () {})
          ],
        ),
      ),
    );
  }
}
