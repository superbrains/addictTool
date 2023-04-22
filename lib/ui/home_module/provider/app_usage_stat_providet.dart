import 'package:addict_tool/ui/shared/app_usage_service.dart';
import 'package:app_usage/app_usage.dart';
import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppUsageStatNotifier extends StateNotifier<AppUsageInfo?> {
  AppUsageStatNotifier(this.ref, this.packageName) : super(null) {
    getAppUsage();
  }

  final Ref ref;
  final String packageName;

  void getAppUsage() async {
    try {
      // await _requestPermission();
      final appUsages = await ref.read(appUsageInfosProvider.future);
      state = appUsages.firstWhereOrNull((element) {
        print('${element.packageName}: $packageName');
        return element.packageName == packageName;
      });
      print('state sff$state');
    } catch (_) {
      print('error iadfd$_');
    }
  }
}

final appUsageProvider =
    StateNotifierProvider.family<AppUsageStatNotifier, AppUsageInfo?, String>(
        (ref, packageName) {
  return AppUsageStatNotifier(ref, packageName);
});
