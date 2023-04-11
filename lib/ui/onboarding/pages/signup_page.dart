import 'package:addict_tool/ui/extension_methods/context_extension.dart';
import 'package:addict_tool/ui/route_names.dart';
import 'package:addict_tool/ui/shared/app_elevated_button.dart';
import 'package:addict_tool/ui/shared/app_input_field.dart';
import 'package:addict_tool/ui/shared/padded_container.dart';
import 'package:addict_tool/ui/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../shared/password_field.dart';
import '../../shared/social_media_button_widget.dart';
import '../widgets/onboard_header.dart';

class SignUpPage extends HookWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = useTextEditingController();
    final phone = useTextEditingController();
    final email = useTextEditingController();
    final password = useTextEditingController();
    final confirmPassword = useTextEditingController();

    return Scaffold(
      body: Column(
        children: [
          const OnboardHeaderWidget(
            title: 'Create an account',
          ),
          Expanded(
            child: PaddedContainer(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppInputField(
                        title: 'Name', child: TextField(controller: name)),
                    const SizedBox(height: 20),
                    AppInputField(
                        title: 'Phone Number',
                        child: TextField(controller: phone)),
                    const SizedBox(height: 20),
                    AppInputField(
                        title: 'Email', child: TextField(controller: email)),
                    const SizedBox(height: 20),
                    AppInputField(
                        title: 'Password',
                        child: PasswordField(controller: password)),
                    const SizedBox(height: 20),
                    AppInputField(
                        title: 'Confirm Password',
                        child: PasswordField(controller: confirmPassword)),
                    const SizedBox(height: 20),
                    AppElevatedButton(onPressed: () {}, label: 'Sign up'),
                    const SizedBox(height: 20),
                    const SocialButtonWidget(),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Have an account? ',
                          style: AppTextStyle.fontWeight400(
                              color: AppColor.textColor1),
                        ),
                        CupertinoButton(
                          onPressed: () {
                            context.pushReplacementNamed(RouteNames.loginPage);
                          },
                          padding: EdgeInsets.zero,
                          child: const Text('Sign in'),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
