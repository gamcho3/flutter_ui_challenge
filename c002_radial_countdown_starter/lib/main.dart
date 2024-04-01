import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0),
          // Use Center as layout has unconstrained width (loose constraints),
          // together with SizedBox to specify the max width (tight constraints)
          // See this thread for more info:
          // https://twitter.com/biz84/status/1445400059894542337
          child: Center(
            child: SizedBox(
              width: 300, // max allowed width
              child: CountdownAndRestart(),
            ),
          ),
        ),
      ),
    );
  }
}

/// Main demo UI (countdown + restart button)
class CountdownAndRestart extends StatefulWidget {
  const CountdownAndRestart({super.key});

  @override
  CountdownAndRestartState createState() => CountdownAndRestartState();
}

class CountdownAndRestartState extends State<CountdownAndRestart>
    with TickerProviderStateMixin {
  // 초기값 10초 설정
  Duration _initial = Duration(seconds: 10);
  // indicator 진행값
  double _progress = 0.0;
  // 남은 시간
  double _remain = 0;

  late final Ticker _ticker;
  late AnimationController _controller;
  static const maxWidth = 300.0;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration.zero);

    _ticker = createTicker((elapsed) {
      setState(() {
        final result = elapsed.inMilliseconds / _initial.inMilliseconds;

        _controller.value = result;
        final remaining = _initial.inSeconds - (result * 10) + 1;
        if (remaining >= 0) {
          _remain = remaining;
        } else {
          _ticker.stop();
          _controller.stop();
        }
        print(_controller.value);
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _ticker.dispose();
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
            child: Stack(
          alignment: Alignment.center,
          children: [
            Transform(
              transform: Matrix4.rotationY(pi),
              alignment: Alignment.center,
              child: SizedBox(
                width: 200,
                height: 200,
                child: CircularProgressIndicator(
                  strokeWidth: 20,
                  value: _controller.value,
                  backgroundColor: Colors.deepPurple,
                  valueColor: const AlwaysStoppedAnimation(
                      Color.fromARGB(255, 117, 34, 132)),
                ),
              ),
            ),
            Text(
              "${_remain.toInt()}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Color.fromARGB(255, 102, 16, 117)),
            ),
          ],
        )),
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _initial = Duration(seconds: 10);
              _ticker.stop();
              _ticker.start();
              _controller.forward();
            });
          },
          child: const Text(
            'Restart',
            style: TextStyle(fontSize: 32),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
