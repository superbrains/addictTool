import 'package:addict_tool/ui/extension_methods/context_extension.dart';
import 'package:addict_tool/ui/shared/app_elevated_button.dart';
import 'package:addict_tool/ui/shared/app_input_field.dart';
import 'package:addict_tool/ui/shared/padded_container.dart';
import 'package:addict_tool/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProfilePage extends HookWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = useTextEditingController()..text = 'Dio  Dre';
    final phone = useTextEditingController()..text = '08089756291';
    final email = useTextEditingController()..text = 'diodre@gmail.com';
    return Scaffold(
      body: PaddedContainer(
        child: Column(
          children: [
            const Spacer(
              flex: 2,
            ),
            Stack(
              children: [
                Image.asset(AssetPath.me),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: CircleAvatar(
                    backgroundColor: context.primaryColor,
                    foregroundColor: context.scaffoldBackgroundColor,
                    child: const Icon(Icons.camera_enhance_rounded),
                  ),
                )
              ],
            ),
            const Spacer(),
            AppInputField(title: 'Name', child: TextField(controller: name)),
            const SizedBox(height: 20),
            AppInputField(
                title: 'Phone Number', child: TextField(controller: phone)),
            const SizedBox(height: 20),
            AppInputField(title: 'Email', child: TextField(controller: email)),
            const SizedBox(height: 20),
            AppElevatedButton(label: 'Done', onPressed: () {}),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
