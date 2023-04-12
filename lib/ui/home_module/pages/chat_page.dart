import 'package:addict_tool/ui/shared/padded_container.dart';
import 'package:addict_tool/ui/shared/svg_render_widget.dart';
import 'package:addict_tool/ui/theme/theme.dart';
import 'package:flutter/material.dart';

import '../widgets/chat_item.dart';
import '../widgets/friends_row.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);
  static const _radius = Radius.circular(20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaddedContainer(
        child: Column(
          children: [
            const SizedBox(height: 24),
            const FriendsRow(),
            const Divider(),
            Expanded(
                child: ListView(
              children: [
                ...chatItems.map((e) => Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ChatItem(image: e.image, name: e.name),
                    )),
                const SizedBox(height: 20),
                ChatItem(
                  image: AssetPath.me,
                  name: 'Me',
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(23, 23, 14, 10),
                    decoration: const BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.only(
                            topRight: _radius,
                            bottomLeft: _radius,
                            bottomRight: _radius)),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 32.0),
                      child: Row(
                        children: [
                          Text(
                            'Typing...',
                            style: AppTextStyle.fontWeight400(
                                fontSize: 12, color: AppColor.addictColor),
                          ),
                          const Spacer(),
                          const SvgRenderWidget(svgPath: AssetPath.sendSvg)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
