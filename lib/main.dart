import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:samsung_browser_test/theme.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final themeMode = watch(appTheme).themeMode;

    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: themeMode,
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      home: MyHomePage(
        themeMode: themeMode,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key? key,
    required this.themeMode,
  }) : super(key: key);
  final ThemeMode themeMode;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColourIcon(color: colorScheme.primary),
            ColourIcon(color: colorScheme.primaryVariant),
            ColourIcon(color: colorScheme.secondary),
            ColourIcon(color: colorScheme.onSecondary),
            Padding(
              padding: const EdgeInsets.all(12),
              child: ElevatedButton(
                onPressed: () => context.read(appTheme).changeThemeMode(),
                child: Text('$themeMode'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ColourIcon extends StatelessWidget {
  const ColourIcon({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: color,
          height: 40,
          width: 40,
        ),
        Container(width: 10),
        SizedBox(
          width: 160,
          child: SelectableText(
            '$color',
            style:
                Theme.of(context).textTheme.headline6?.copyWith(color: color),
          ),
        ),
      ],
    );
  }
}
