import 'package:addict_tool/ui/extension_methods/context_extension.dart';
import 'package:addict_tool/ui/home_module/widgets/app_list.dart';
import 'package:addict_tool/ui/shared/padded_container.dart';
import 'package:addict_tool/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/app_monitor_provider.dart';
import '../widgets/app_elaspe_time_widget.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaddedContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Text('Hello, phillip boy J smith',
                style: AppTextStyle.fontWeight500(fontSize: 24)),
            const SizedBox(height: 12),
            Text('Manage your time well',
                style: AppTextStyle.fontWeight500(
                    color: AppColor.secondaryAddict)),
            const SizedBox(height: 14),
            Image.asset(AssetPath.totalTime, width: double.maxFinite),
            Expanded(child: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final appsState = ref.watch(addedAppItemsProvider);
                return appsState.maybeWhen(
                    data: (apps) => ListView(
                          children: [
                            const SizedBox(height: 20),
                            ...apps.reversed.map((e) => Padding(
                                  padding: const EdgeInsets.only(bottom: 20.0),
                                  child: AppElapseTimeWidget(
                                    app: e,
                                  ),
                                ))
                          ],
                        ),
                    orElse: () =>
                        const Center(child: CircularProgressIndicator()));
              },
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.showBottomSheet(
              child: const AppListBottomSheet(), heightFraction: 0.5);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
