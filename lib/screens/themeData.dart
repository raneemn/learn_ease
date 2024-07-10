import 'package:flutter/material.dart';

class ThemeDataTest extends StatelessWidget {
  const ThemeDataTest({super.key});
  static const routeName = '/themeDATA';

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      brightness: MediaQuery.platformBrightnessOf(context),
      seedColor: Colors.indigo,
    );
    return MaterialApp(
      title: 'ThemeData Demo',
      theme: ThemeData(
        colorScheme: colorScheme,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: colorScheme.tertiary,
          foregroundColor: colorScheme.onTertiary,
        ),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int buttonPressCount = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final double pointCount = 8 + (buttonPressCount % 6);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Press the + Button'),
      ),
      // An AnimatedContainer makes the decoration changes entertaining.
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        margin: const EdgeInsets.all(32),
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          color: colorScheme.tertiaryContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(width: 6, color: colorScheme.tertiary),
          ),
        ),
        child: Text(
          '${pointCount.toInt()} Points',
          style: theme.textTheme.headlineMedium!.copyWith(
            color: colorScheme.onPrimaryContainer,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            buttonPressCount += 1;
          });
        },
        tooltip: "Change the shape's point count",
        child: const Icon(Icons.add),
      ),
    );
  }
}
