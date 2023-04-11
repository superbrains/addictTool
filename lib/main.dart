import 'package:addict_tool/ui/route_names.dart';
import 'package:addict_tool/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: AddictToolApp()));
}

class AddictToolApp extends StatelessWidget {
  const AddictToolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Addict Tool',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      routes: RouteNames.routes,
      initialRoute: RouteNames.splashScreen,
    );
  }
}
