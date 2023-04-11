import 'package:addict_tool/ui/extension_methods/context_extension.dart';
import 'package:addict_tool/ui/route_names.dart';
import 'package:addict_tool/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/pageview_dot_indicator.dart';
import '../widgets/onboard_item_widget.dart';

class OnboardingPageView extends HookWidget {
  const OnboardingPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    return Scaffold(
      body: Column(
        children: [
          const Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 6,
            child: PageView(
              controller: pageController,
              children: const [
                OnboardItemWidget(
                  image: AssetPath.onboard1,
                  title: 'Track All Your Mobile Application',
                  message:
                      'lets help you track all your mobile application activities',
                ),
                OnboardItemWidget(
                  image: AssetPath.onboard2,
                  title: 'Be More Productive With Your Time',
                  message:
                      'Set a time tracker for all your mobile applications on your phone',
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 245,
            child: ElevatedButton(
                onPressed: () {
                  context.pushNamed(RouteNames.signUpPage);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HookConsumer(
                      builder:
                          (BuildContext context, WidgetRef ref, Widget? child) {
                        final texts = ['Skip', 'Continue'];
                        final index = useListenableSelector(pageController,
                            () => pageController.page?.toInt() ?? 0);
                        return Text(texts[index]);
                      },
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_right_alt_sharp)
                  ],
                )),
          ),
          const SizedBox(height: 20),
          PageViewDotIndicator(pageController: pageController, totalItem: 2),
          const Spacer(
            flex: 3,
          )
        ],
      ),
    );
  }
}
