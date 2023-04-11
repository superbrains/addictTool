import 'package:addict_tool/ui/extension_methods/context_extension.dart';
import 'package:addict_tool/ui/shared/svg_render_widget.dart';
import 'package:addict_tool/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/page_index_provider.dart';

class BottomNavWidget extends ConsumerWidget {
  const BottomNavWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(pageIndexProvider);
    void _onTap(int index) {
      ref.read(pageIndexProvider.notifier).setPageIndex(index);
      switch (index) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
      }
    }

    return BottomAppBar(
      child: Container(
        decoration: BoxDecoration(
            color: context.primaryColor,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(20))),
        height: 63,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _NavItem(
              selected: currentIndex == 0,
              onTap: () => _onTap(0),
              title: 'Analytics',
              svgPath: AssetPath.analyticsSvg,
            ),
            _NavItem(
              title: 'Chat',
              svgPath: AssetPath.chatSvg,
              selected: currentIndex == 1,
              onTap: () => _onTap(1),
            ),
            _NavItem(
              title: 'Home',
              svgPath: AssetPath.homeSvg,
              selected: currentIndex == 2,
              onTap: () => _onTap(2),
            ),
            _NavItem(
              title: 'Profile',
              svgPath: AssetPath.userSvg,
              selected: currentIndex == 3,
              onTap: () => _onTap(3),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem(
      {Key? key,
      this.onTap,
      this.title = '',
      this.iconWidget,
      this.showTitle = true,
      this.selected = false,
      this.svgPath = ''})
      : super(key: key);
  final String title;
  final String svgPath;
  final bool selected;
  final VoidCallback? onTap;
  final Widget? iconWidget;
  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          iconWidget ??
              SvgRenderWidget(
                svgPath: svgPath,
                color: selected
                    ? context.scaffoldBackgroundColor
                    : context.scaffoldBackgroundColor.withOpacity(0.8),
                height: 20,
                width: 20,
              ),
          if (showTitle) const SizedBox(height: 6),
          if (showTitle)
            Text(
              title,
              style: context.textTheme.subtitle1?.copyWith(
                  fontSize: 11,
                  color: selected
                      ? context.scaffoldBackgroundColor
                      : context.scaffoldBackgroundColor.withOpacity(0.8)),
            ),
          SizedBox(height: showTitle ? 4 : 8),
        ],
      ),
    );
  }
}
