import 'package:addict_tool/ui/home_module/widgets/app_elaspe_time_widget.dart';
import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class AppListBottomSheet extends StatelessWidget {
  const AppListBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Expanded(
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 32, crossAxisCount: 4),
            children: [
              ...sampleApps.map((e) => _AppColumn(
                    appItem: e,
                  ))
            ],
          ),
        ),
      ],
    );
  }
}

class _AppColumn extends StatelessWidget {
  const _AppColumn({Key? key, required this.appItem}) : super(key: key);
  final AppItem appItem;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          appItem.icon,
          height: 42,
          width: 42,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 8),
        Text(
          appItem.app,
          style: AppTextStyle.fontWeight400(fontSize: 14, color: Colors.black),
        ),
      ],
    );
  }
}
