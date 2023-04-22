import 'package:addict_tool/ui/home_module/provider/social_media_app_provider.dart';
import 'package:addict_tool/ui/shared/local_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:installed_apps/app_info.dart';

class AddedPackageNotifier extends StateNotifier<List<String>> {
  AddedPackageNotifier(this.ref, [List<String> savedPackages = const []])
      : super(savedPackages);
  final Ref ref;

  LocalStorage get localStorage => ref.read(localStorageProvider);

  void add(String? packageName) {
    try {
      if (packageName == null) return;
      if (state.contains(packageName)) {
        return;
      } else {
        state = [...state..add(packageName)];
      }
    } catch (_) {
    } finally {
      localStorage.saveAddedPackages(state);
    }
  }

  void remove(String? packageName) {
    try {
      if (packageName == null) return;
      if (state.contains(packageName)) {
        state = [...state..remove(packageName)];
      }
    } catch (_) {
    } finally {
      localStorage.saveAddedPackages(state);
    }
  }
}

final addedPackageNameProvider =
    StateNotifierProvider<AddedPackageNotifier, List<String>>((ref) {
  final localPackages = ref.watch(localStorageProvider).addedPackages;
  return AddedPackageNotifier(ref, localPackages);
});

final addedAppItemsProvider = FutureProvider<List<AppInfo>>((ref) async {
  final socialApps = await ref.watch(socialAppsProvider.future);
  final addedPackageName = ref.watch(addedPackageNameProvider);
  return socialApps
      .where((appInfo) => addedPackageName.contains(appInfo.packageName))
      .toList();
});
