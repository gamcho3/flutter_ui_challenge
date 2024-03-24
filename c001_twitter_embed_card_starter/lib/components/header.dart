import 'package:flutter/material.dart';
import 'package:twitter_embed_card/svg_asset.dart';
import 'package:twitter_embed_card/svg_icon.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
                    Text(
                      "Andrea Bizzotto",
                      style: TextStyle(fontWeight: FontWeight.bold),
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
                    UnderlineTextButton()
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

class UnderlineTextButton extends StatefulWidget {
  const UnderlineTextButton({
    super.key,
  });

  @override
  State<UnderlineTextButton> createState() => _UnderlineTextButtonState();
}

class _UnderlineTextButtonState extends State<UnderlineTextButton> {
  var textline = TextDecoration.none;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      // onHover: (event) {
      //   print(event);
      // },
      onEnter: (event) {
        print(event);
        setState(() {
          textline = TextDecoration.underline;
        });
      },
      onExit: (event) {
        setState(() {
          textline = TextDecoration.none;
        });
      },
      child: Text(
        "Follow",
        style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            decoration: textline),
      ),
    );
  }
}
