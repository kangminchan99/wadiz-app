import 'package:flutter/material.dart';
import 'package:wabiz/src/core/router/router.dart';
import 'package:wabiz/src/core/theme/theme.dart';

void main() {
  runApp(const WabizApp());
}

class WabizApp extends StatelessWidget {
  const WabizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Wabiz',
      theme: wabizDefaultTheme,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      // 테마가 바뀔때 애니메이션 효과를 주는 옵션
      themeAnimationStyle: AnimationStyle(
        curve: Curves.easeInCirc,
        duration: const Duration(milliseconds: 500),
      ),
      routerConfig: router,
    );
  }
}
