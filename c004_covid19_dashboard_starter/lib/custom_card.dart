import 'package:c004_covid19_dashboard/main.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.point, required this.value});

  final DataPoint point;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(point.name,
                style: TextStyle(color: point.color, fontSize: 30)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  point.assetPath,
                  color: point.color,
                ),
                Text(
                  value.toString(),
                  style: TextStyle(color: point.color, fontSize: 30),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
