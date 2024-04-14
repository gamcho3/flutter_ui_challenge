import 'package:c004_covid19_dashboard/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

/// A type representing the various available data points
enum DataPoint {
  casesTotal('Total Cases', 'assets/count.png', Color(0xFFFFF492)),
  casesActive('Active Cases', 'assets/fever.png', Color(0xFFE99600)),
  deaths('Deaths', 'assets/death.png', Color(0xFFE40000)),
  recovered('Recovered', 'assets/patient.png', Color(0xFF70A901));

  const DataPoint(this.name, this.assetPath, this.color);
  final String name;
  final String assetPath;
  final Color color;
}

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    // print(_themeMode.name);

    bool isDark = _themeMode.name == 'dark' ? true : false;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('COVID-19 Tracker'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          // Use Center as layout has unconstrained width (loose constraints),
          // together with SizedBox to specify the max width (tight constraints)
          // See this thread for more info:
          // https://twitter.com/biz84/status/1445400059894542337
          child: Center(
            child: SizedBox(
              width: 500, // max allowed width
              child: Column(
                children: [
                  Switch(
                      value: isDark,
                      onChanged: (value) {
                        setState(() {
                          value
                              ? _themeMode = ThemeMode.dark
                              : _themeMode = ThemeMode.light;
                        });
                      }),
                  Dashboard(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // Some random values
    final values = [
      9231249,
      123214,
      51245,
      7452340,
    ];
    // TODO: Implement UI
    return Column(
      children: values
          .mapIndexed((index, e) => Column(
                children: [
                  CustomCard(point: DataPoint.values[index], value: e),
                  SizedBox(
                    height: 10,
                  )
                ],
              ))
          .toList(),
    );
  }
}
