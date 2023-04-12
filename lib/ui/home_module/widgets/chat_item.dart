import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class ChatItem extends StatelessWidget {
  const ChatItem(
      {Key? key, this.child, required this.image, required this.name})
      : super(key: key);
  final String image;
  final String name;
  final Widget? child;
  static const _radius = Radius.circular(20);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image, height: 30),
            const SizedBox(width: 8),
            Text(
              name,
              style:
                  AppTextStyle.fontWeight500(fontSize: 12, color: Colors.black),
            ),
            const Spacer(),
            Text('2 Sept 2021',
                style: AppTextStyle.fontWeight400(
                    fontSize: 12, color: AppColor.secondaryAddict)),
            const Spacer(),
            const SizedBox(width: 60),
          ],
        ),
        const SizedBox(height: 8),
        child ??
            Container(
              padding: const EdgeInsets.fromLTRB(23, 23, 14, 10),
              decoration: const BoxDecoration(
                  color: AppColor.iconFontColor,
                  borderRadius: BorderRadius.only(
                      topRight: _radius,
                      bottomLeft: _radius,
                      bottomRight: _radius)),
              child: Column(
                children: [
                  Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum',
                    style: AppTextStyle.fontWeight400(
                        fontSize: 12, color: AppColor.secondaryAddict),
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        '5:00 PM',
                        style: AppTextStyle.fontWeight400(
                            fontSize: 12, color: AppColor.secondaryAddict),
                      )
                    ],
                  )
                ],
              ),
            )
      ],
    );
  }
}

const chatItems = [
  ChatItem(
    image: AssetPath.person,
    name: 'Paul White',
  ),
  ChatItem(
    image: AssetPath.friend,
    name: 'Queen Tot',
  ),
  ChatItem(
    image: AssetPath.person,
    name: 'Manu Ray',
  ),
];
