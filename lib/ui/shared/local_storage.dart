import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  late SharedPreferences _preferences;
  static const _addedPackagesKey = '_addedPackagesKey';

  Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  List<String> get addedPackages {
    return _preferences.getStringList(_addedPackagesKey) ?? [];
  }

  void saveAddedPackages(List<String> packages) async {
    try {
      await _preferences.setStringList(_addedPackagesKey, packages);
    } catch (_) {}
  }
}

final localStorageProvider = Provider<LocalStorage>((ref) {
  return LocalStorage();
});
