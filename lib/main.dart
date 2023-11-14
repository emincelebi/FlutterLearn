import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/202/theme/light_theme.dart';
import 'package:flutter_full_learn/202/theme_learn_view.dart';
import '202/package_learn_view.dart';
import '202/service/service_learn_get_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: LighTheme().theme,
      // theme: ThemeData.dark().copyWith(
      //   bottomAppBarTheme: const BottomAppBarTheme(shape: CircularNotchedRectangle()),
      //   tabBarTheme: const TabBarTheme(
      //       labelColor: Colors.green, unselectedLabelColor: Colors.white, indicatorSize: TabBarIndicatorSize.label),
      //   progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.white),
      //   appBarTheme: const AppBarTheme(
      //     centerTitle: true,
      //     systemOverlayStyle: SystemUiOverlayStyle.light,
      //     elevation: 0,
      //     backgroundColor: Colors.transparent,
      //   ),
      //   cardTheme: CardTheme(
      //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      //   ),
      // ),
      home: const ThemeLearnView(),
    );
  }
}
