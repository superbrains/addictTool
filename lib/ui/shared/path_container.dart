import 'package:addict_tool/ui/extension_methods/context_extension.dart';
import 'package:addict_tool/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class PathContainer extends StatelessWidget {
  const PathContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height,
      width: context.width,
      child: Image.asset(
        AssetPath.addictPath,
      ),
    );
  }
}
