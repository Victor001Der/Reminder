import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:reminder_app/data/models/reminder_model.dart';
import 'app.dart';

Future<void> main() async {

   //1.без этой строчки крашется hive
   WidgetsFlutterBinding.ensureInitialized();

   //2. Инициализируем Hive
   await Hive.initFlutter();

   //3. Регестрирую адаптер
   Hive.registerAdapter(ReminderAdapter());

   //4. Открываю коробку
   await Hive.openBox<Reminder>('reminder_cache');
   
   runApp(ReminderApp());
}