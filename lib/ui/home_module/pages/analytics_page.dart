import 'package:addict_tool/ui/shared/padded_container.dart';
import 'package:addict_tool/ui/theme/theme.dart';
import 'package:flutter/material.dart';

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
          ],
        ),
      ),
    );
  }
}
