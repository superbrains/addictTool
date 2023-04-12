import 'package:addict_tool/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class FriendsRow extends StatelessWidget {
  const FriendsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ...[
            AssetPath.me,
            AssetPath.friend,
            AssetPath.person,
            AssetPath.friend,
          ].map((e) => Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Column(
                  children: [
                    Image.asset(
                      e,
                      height: 52,
                      width: 52,
                    ),
                    const SizedBox(height: 6),
                    if (e == AssetPath.me)
                      Text(
                        'Me',
                        style: AppTextStyle.fontWeight500(
                            fontSize: 12, color: Colors.black),
                      )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
