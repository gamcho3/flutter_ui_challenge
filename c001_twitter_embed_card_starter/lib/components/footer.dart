import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:twitter_embed_card/svg_asset.dart';
import 'package:twitter_embed_card/svg_icon.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(DateFormat('HH:mm a · MMM dd, yyyy').format(DateTime.now())),
            SvgIcon(
              asset: SvgAsset.info,
              width: 20,
              height: 20,
            )
          ],
        ),
        const Divider(),
        Row(
          children: [
            customInfo(SvgIcon(asset: SvgAsset.heartRed), "999"),
            SizedBox(
              width: 20,
            ),
            customInfo(SvgIcon(asset: SvgAsset.comment), "Reply"),
            SizedBox(
              width: 20,
            ),
            customInfo(SvgIcon(asset: SvgAsset.link), "Copy link"),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blue.shade700,
                elevation: 0,
                shadowColor: Colors.transparent,
                side: BorderSide(color: Colors.grey)),
            onPressed: () {},
            child: Text(
              "Read 12 replies",
              style: TextStyle(fontWeight: FontWeight.bold),
            ))
      ],
    );
  }

  Widget customInfo(SvgIcon icon, String content) {
    return Row(
      children: [
        icon,
        SizedBox(
          width: 10,
        ),
        Text(
          content,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.grey.shade600),
        )
      ],
    );
  }
}
