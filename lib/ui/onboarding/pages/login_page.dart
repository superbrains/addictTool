import 'package:addict_tool/ui/extension_methods/context_extension.dart';
import 'package:addict_tool/ui/shared/app_elevated_button.dart';
import 'package:addict_tool/ui/shared/app_input_field.dart';
import 'package:addict_tool/ui/shared/padded_container.dart';
import 'package:addict_tool/ui/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../route_names.dart';
import '../../shared/password_field.dart';
import '../../shared/social_media_button_widget.dart';
import '../widgets/onboard_header.dart';

class LoginPage extends HookWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final email = useTextEditingController();
    final password = useTextEditingController();

    return Scaffold(
      body: Column(
        children: [
          const OnboardHeaderWidget(
            title: 'Login To Your Account',
          ),
          PaddedContainer(
            child: Column(
              children: [
                AppInputField(
                    title: 'Email', child: TextField(controller: email)),
                const SizedBox(height: 20),
                AppInputField(
                    title: 'Password',
                    child: PasswordField(controller: password)),
                const SizedBox(height: 20),
                AppElevatedButton(onPressed: () {}, label: 'Sign in'),
                const SizedBox(height: 20),
                const SocialButtonWidget(),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t an Account? ",
                      style: AppTextStyle.fontWeight400(
                          color: AppColor.textColor1),
                    ),
                    CupertinoButton(
                      onPressed: () {
                        context.pushReplacementNamed(RouteNames.signUpPage);
                      },
                      padding: EdgeInsets.zero,
                      child: const Text('Sign up'),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
