import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Content extends StatelessWidget {
  const Content({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          """
Did you know?

When you call `MediaQuery.of(context)` inside a build method, the widget will rebuild when *any* of the MediaQuery properties change.

But there's a better way that lets you depend only on the properties you care about (and minimize unnecessary rebuilds). 👇
""",
          style: TextStyle(height: 1.2),
        ),
        ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset("assets/media-query-banner.jpg"))
      ],
    );
  }
}
