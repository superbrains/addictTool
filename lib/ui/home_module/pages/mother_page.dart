import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/page_index_provider.dart';
import '../widgets/bottom_nav.dart';
import 'analytics_page.dart';
import 'chat_page.dart';
import 'profile_page.dart';

class MotherHomePage extends ConsumerWidget {
  const MotherHomePage({Key? key}) : super(key: key);

  static const _body = <Widget>[
    AnalyticsPage(),
    ChatPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(pageIndexProvider);
    return WillPopScope(
      onWillPop: () async {
        if (index > 0) {
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
