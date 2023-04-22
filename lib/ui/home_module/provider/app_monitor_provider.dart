import 'package:addict_tool/ui/shared/package_info_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:installed_apps/app_info.dart';

class AddedPackageNotifier extends StateNotifier<List<String>> {
  AddedPackageNotifier() : super([]);

  void add(String? packageName) {
    try {
      if (packageName == null) return;
      if (state.contains(packageName)) {
        return;
      } else {
        state = [...state..add(packageName)];
      }
    } catch (_) {}
  }

  void remove(String? packageName) {
    try {
      if (packageName == null) return;
      if (state.contains(packageName)) {
        state = [...state..remove(packageName)];
      }
    } catch (_) {}
  }
}

final addedPackageNameProvider =
    StateNotifierProvider<AddedPackageNotifier, List<String>>((ref) {
  return AddedPackageNotifier();
});

final addedAppItemsProvider = FutureProvider<List<AppInfo>>((ref) async {
  final socialApps = await ref.watch(socialAppsProvider.future);
  final addedPackageName = ref.watch(addedPackageNameProvider);
  return socialApps
      .where((appInfo) => addedPackageName.contains(appInfo.packageName))
      .toList();
});
