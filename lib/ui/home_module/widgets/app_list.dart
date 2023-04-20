import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:installed_apps/app_info.dart';

import '../../shared/package_info_service.dart';
import '../../theme/theme.dart';

class AppListBottomSheet extends StatelessWidget {
  const AppListBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Expanded(
          child: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final socialApps = ref.watch(socialAppsProvider);
              return socialApps.maybeWhen(
                  data: (apps) => GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 32, crossAxisCount: 4),
                        children: [
                          ...apps.map((e) => _AppColumn(
                                appItem: e,
                              ))
                        ],
                      ),
                  orElse: () => const Center(
                        child: CircularProgressIndicator(),
                      ));
            },
          ),
        )
      ],
    );
  }
}

class _AppColumn extends StatelessWidget {
  const _AppColumn({Key? key, required this.appItem}) : super(key: key);
  final AppInfo appItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (appItem.icon != null)
          Image.memory(
            appItem.icon!,
            height: 42,
            width: 42,
            fit: BoxFit.cover,
          ),
        const SizedBox(height: 8),
        Text(
          appItem.name ?? '',
          textAlign: TextAlign.center,
          style: AppTextStyle.fontWeight400(fontSize: 14, color: Colors.black),
        ),
      ],
    );
  }
}
