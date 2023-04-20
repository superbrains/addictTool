import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';

class AppInfoService {
  Future<List<AppInfo>> get apps async =>
      await InstalledApps.getInstalledApps(true, true);
  static List<String> socialMediaApps = [
    'Facebook',
    'Twitter',
    'Instagram',
    'Snapchat',
    'TikTok',
    'LinkedIn',
    'Pinterest',
    'Tumblr',
    'Reddit',
    'YouTube',
    'WhatsApp',
    'WeChat',
    'Line',
    'Telegram',
    'Viber',
    'Kik',
    'Twitch',
    'Clubhouse',
    'Discord',
    'Bumble',
    'Hinge',
    'Grindr',
    'OkCupid',
    'Tinder',
    'Meetup',
    'Nextdoor',
    'Flickr',
    'Vine',
    'Google+',
    'Periscope',
    'Meerkat',
    'Peach',
    'Mastodon',
    'Ello',
  ];
}

final appInfoServiceProvider = Provider<AppInfoService>((ref) {
  return AppInfoService();
});

final socialAppsProvider = FutureProvider<List<AppInfo>>((ref) async {
  final apps = await ref.watch(appInfoServiceProvider).apps;
  List<AppInfo> socialMediaApps = [];
  for (AppInfo package in apps) {
    final packageName = package.packageName ?? "";
    for (String app in AppInfoService.socialMediaApps) {
      if (packageName.contains(app.toLowerCase())) {
        socialMediaApps.add(package);
      }
    }
  }
  return socialMediaApps;
});
