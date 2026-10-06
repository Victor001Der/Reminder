import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';

class ReminderApp extends StatelessWidget {
const ReminderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Напоминалка',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,//выбираю светлую тему как основу, 
      //нуно будет поменять на system после реализации настроек
      home: const HomeScreen(),
    );
  }


}