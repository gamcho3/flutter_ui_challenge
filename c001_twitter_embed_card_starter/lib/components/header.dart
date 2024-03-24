import 'package:flutter/material.dart';
import 'package:twitter_embed_card/components/underline_text_button.dart';
import 'package:twitter_embed_card/svg_asset.dart';
import 'package:twitter_embed_card/svg_icon.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/andrea-avatar.png'),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    UnderlineTextButton(
                      title: "Andrea Bizzotto",
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    SvgIcon(
                      asset: SvgAsset.heartBlue,
                      width: 18,
                      height: 18,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    SvgIcon(
                      asset: SvgAsset.verified,
                      width: 20,
                      height: 20,
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "@biz84",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "·",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    UnderlineTextButton(
                      title: 'Follow',
                      color: Colors.blue,
                    )
                  ],
                ),
              ],
            )
          ],
        ),
        SvgIcon(asset: SvgAsset.x)
      ],
    );
  }
}
