import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:twitter_embed_card/components/footer.dart';
import 'package:twitter_embed_card/components/header.dart';
import 'package:twitter_embed_card/components/content.dart';
import 'package:twitter_embed_card/svg_asset.dart';
import 'package:twitter_embed_card/svg_icon.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SvgAsset.preloadSVGs();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(useMaterial3: true, primaryColor: Colors.purple.shade200),
      home: const Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          // Use Center as layout has unconstrained width (loose constraints),
          // together with SizedBox to specify the max width (tight constraints)
          // See this thread for more info:
          // https://twitter.com/biz84/status/1445400059894542337
          child: Center(
            child: SizedBox(
              width: 600, // max allowed width
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TwitterEmbedCard(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TwitterEmbedCard extends StatelessWidget {
  const TwitterEmbedCard({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Delete this and implement the desired layout
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Header(),
        SizedBox(
          height: 15,
        ),
        Content(),
        SizedBox(
          height: 10,
        ),
        Footer()
      ],
    );
  }
}
