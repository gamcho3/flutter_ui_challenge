import 'package:flutter/material.dart';

class UnderlineTextButton extends StatefulWidget {
  const UnderlineTextButton({
    super.key,
    required this.title,
    this.color = Colors.black,
  });

  final String title;
  final Color color;

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
        widget.title,
        style: TextStyle(
            color: widget.color,
            fontWeight: FontWeight.bold,
            decoration: textline),
      ),
    );
  }
}
