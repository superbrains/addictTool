import 'package:addict_tool/ui/shared/padded_container.dart';
import 'package:addict_tool/ui/theme/theme.dart';
import 'package:flutter/material.dart';

import '../widgets/app_elaspe_time_widget.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(elevation: 0, backgroundColor: context.scaffoldBackgroundColor),
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
            Expanded(
                child: ListView(
              children: [
                const SizedBox(height: 20),
                ...sampleApps.map((e) => Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: AppElapseTimeWidget(
                        app: e,
                      ),
                    ))
              ],
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
