import 'package:flutter/material.dart';
import 'trading_dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TGS-RFS PRO Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0A0F), // C_BG0
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00BCD4), // C_CYAN
          secondary: Color(0xFFFFD700), // C_GOLD
          surface: Color(0xFF111118), // C_BG1
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const TradingDashboard(),
      },
    );
  }
}
