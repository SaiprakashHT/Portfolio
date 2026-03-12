import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/firebase_options.dart';
import 'core/theme/app_theme.dart';
import 'screens/portfolio_page.dart';

void main() async {
  // 1. Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Initialize Firebase using the generated options
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = true;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saiprakash H T - Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: PortfolioPage(onThemeToggle: _toggleTheme, isDarkMode: _isDarkMode),
    );
  }
}
