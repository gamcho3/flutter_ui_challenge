import 'package:flutter/material.dart';
import 'package:page_flip/animated_page_flip_builder.dart';

class PageFlipBuilder extends StatefulWidget {
  const PageFlipBuilder(
      {super.key, required this.frontBuilder, required this.backBuilder});
  final WidgetBuilder frontBuilder;
  final WidgetBuilder backBuilder;

  @override
  State<PageFlipBuilder> createState() => PageFlipBuilderState();
}

class PageFlipBuilderState extends State<PageFlipBuilder>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool state = true;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addListener(() {
        // print(_controller..value);
      });

    _controller.addStatusListener(updateStatus);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    _controller.removeStatusListener(updateStatus);
    super.dispose();
  }

  void updateStatus(AnimationStatus status) {
    print(status);
    if (status == AnimationStatus.completed ||
        status == AnimationStatus.dismissed) {
      setState(() {
        state = !state;
      });
    }
  }

  void flip() {
    if (state) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPageFlipBuiler(
      animation: _controller,
      frontBuilder: widget.frontBuilder,
      backBuilder: widget.backBuilder,
    );
  }
}
