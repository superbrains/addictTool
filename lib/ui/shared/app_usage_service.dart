import 'package:app_usage/app_usage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppUsageService {
  Future<List<AppUsageInfo>> getAppUsageInfo() async {
    print("I am called");
    final now = DateTime.now();
    final List<AppUsageInfo> _infos = await AppUsage().getAppUsage(
      DateTime(now.year, now.month, now.day),
      now,
    );
    return _infos;
  }
}

final appsUsageServiceProvider = Provider<AppUsageService>((ref) {
  return AppUsageService();
});
final appUsageInfosProvider =
    FutureProvider.autoDispose<List<AppUsageInfo>>((ref) async {
  return ref.watch(appsUsageServiceProvider).getAppUsageInfo();
});
