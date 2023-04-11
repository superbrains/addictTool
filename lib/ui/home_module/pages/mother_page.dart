import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/page_index_provider.dart';
import '../widgets/bottom_nav.dart';
import 'analytics_page.dart';

class MotherHomePage extends ConsumerWidget {
  const MotherHomePage({Key? key}) : super(key: key);

  static const _body = <Widget>[
    AnalyticsPage(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(pageIndexProvider);

    return WillPopScope(
      onWillPop: () async {
        if (index > 0) {
          //ref.read(pageIndexProvider.notifier).communityTab();
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: _body[index],
        bottomNavigationBar: const BottomNavWidget(),
      ),
    );
  }
}
