import 'dart:math';

import 'package:flutter/material.dart';
import 'package:logger/web.dart';

class AnimatedPageFlipBuiler extends StatelessWidget {
  const AnimatedPageFlipBuiler({
    super.key,
    required this.animation,
    required this.frontBuilder,
    required this.backBuilder,
  });

  final Animation<double> animation;
  final WidgetBuilder frontBuilder;
  final WidgetBuilder backBuilder;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, _) {
          var logger = Logger();
          // [0-3.14(pi)] 진행
          final rotationValue = animation.value * pi;
          // logger.d(rotationValue);
          // [0-1]의 절반 확인
          final isHalf = animation.value.abs() < 0.5;

          final widget = isHalf ? frontBuilder(context) : backBuilder(context);
          // 카드가 뒤로갔을때 0, 아닐때 3.14
          final rotationAngle =
              animation.value > 0.5 ? pi - rotationValue : rotationValue;

          // matrix4의 값을 수정
          var tilt = (animation.value - 0.5).abs() - 0.5;
          tilt *= isHalf ? -0.003 : 0.003;
          return Transform(
            transform: Matrix4.rotationY(rotationAngle)..setEntry(3, 0, tilt),
            alignment: Alignment.center,
            child: widget,
          );
        });
  }
}
