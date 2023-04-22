import 'package:addict_tool/ui/extension_methods/context_extension.dart';
import 'package:addict_tool/ui/extension_methods/int_extension.dart';
import 'package:addict_tool/ui/shared/app_elevated_button.dart';
import 'package:addict_tool/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:installed_apps/app_info.dart';

import '../pages/set_time_page.dart';
import '../provider/app_monitor_provider.dart';
import '../provider/app_usage_stat_providet.dart';

class AppItem {
  final String app;
  final String icon;

  AppItem({required this.app, required this.icon});
}

final sampleApps = [
  AppItem(app: 'Slack', icon: AssetPath.slack),
  AppItem(app: 'Tiktok', icon: AssetPath.tiktok),
  AppItem(app: 'Whatsapp', icon: AssetPath.whatsapp),
  AppItem(app: 'Facebook', icon: AssetPath.facebook),
  AppItem(app: 'Twitter', icon: AssetPath.twitter),
  AppItem(app: 'Instagram', icon: AssetPath.instagram),
  AppItem(app: 'Telegram', icon: AssetPath.telegram),
  AppItem(app: 'Skype', icon: AssetPath.skype),
];

class AppElapseTimeWidget extends ConsumerWidget {
  const AppElapseTimeWidget({Key? key, required this.app}) : super(key: key);
  final AppInfo app;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appUsage = ref.watch(appUsageProvider('${app.packageName}'));
    return Container(
      decoration: BoxDecoration(
        color: AppColor.cardBackground,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Spacer(),
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return IconButton(
                      onPressed: () {
                        ref
                            .read(addedPackageNameProvider.notifier)
                            .remove(app.packageName);
                      },
                      icon: const Icon(Icons.cancel),
                      iconSize: 22,
                      color: const Color(0xff717070));
                },
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(22.0, 0, 22, 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'App',
                          style: AppTextStyle.fontWeight700(
                              color: AppColor.primaryColor),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            if (app.icon != null)
                              Image.memory(app.icon!, height: 21, width: 21),
                            const SizedBox(width: 4),
                            Text(
                              app.name ?? '',
                              style: AppTextStyle.fontWeight400(),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Elapsed time',
                          style: AppTextStyle.fontWeight700(
                              color: AppColor.primaryColor),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          appUsage?.usage != null
                              ? '${appUsage?.usage.inMinutes.formatMinTime}'
                              : '0 Min',
                          style: AppTextStyle.fontWeight400(),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Time Remaining',
                          style: AppTextStyle.fontWeight700(
                              color: AppColor.primaryColor),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '4 mins',
                          style: AppTextStyle.fontWeight400(),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 90,
                      child: AppElevatedButton(
                        label: 'Edit limit',
                        style: ElevatedButton.styleFrom(
                            textStyle: AppTextStyle.fontWeight500(
                                fontSize: 13, color: AppColor.white)),
                        onPressed: () {
                          context.push(SetTimeOutPage(app: app));
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
