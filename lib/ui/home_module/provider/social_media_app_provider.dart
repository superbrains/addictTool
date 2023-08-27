import 'dart:developer' as developer;
import 'dart:io';
import 'dart:typed_data';

import 'package:addict_tool/ui/home_module/provider/social_media_uint8list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';

class AppInfoService {
  Future<List<AppInfo>> get apps async {
    try {
      if (Platform.isAndroid) {
        final apps = await InstalledApps.getInstalledApps(true, true);
        return apps;
      } else {
        return [
          AppInfo('Facebook', Uint8List.fromList(facebookUint8List),
              'facebook.com', '1', 1),
          AppInfo('Instagram', Uint8List.fromList(instagramUint8List),
              'instagram.com', '1', 1),
          AppInfo('Whatsapp', Uint8List.fromList(whatsappUint8List),
              'whatsapp.com', '1', 1),
          AppInfo('Snapchat', Uint8List.fromList(snapshatUint8List),
              'snapchat.com', '1', 1),
          AppInfo('Tiktok', Uint8List.fromList(tiktokUint8List), 'tiktok.com',
              '1', 1),
        ];
      }
    } catch (_) {
      rethrow;
    }
  }

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
    'Meerkat',
    'Peach',
  ];
}

final appInfoServiceProvider = Provider<AppInfoService>((ref) {
  return AppInfoService();
});

final socialAppsProvider = FutureProvider<List<AppInfo>>((ref) async {
  final apps = await ref.watch(appInfoServiceProvider).apps;
  List<AppInfo> socialMediaApps = [];
  for (AppInfo package in apps) {
    final packageName = package.name ?? "";
    for (String app in AppInfoService.socialMediaApps) {
      if (packageName.toLowerCase().contains(app.toLowerCase())) {
        socialMediaApps.add(package);
      }
    }
  }
  socialMediaApps.forEach((element) {
    developer.log('\n${element.name}=> ${element.icon}\n');
  });
  return socialMediaApps;
});
