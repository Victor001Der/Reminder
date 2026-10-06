import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'reminder_model.g.dart';

@HiveType(typeId: 0)
class Reminder extends Equatable{
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final DateTime dateTime;
  @HiveField(3) 
  final bool isDone;

  const Reminder({
    required this.id,
    required this.title,
    required this.dateTime,
    this.isDone = false,
  });

  Reminder copyWith({
    String? title,
    DateTime? dateTime,
    bool? isDone,
  }){
    return Reminder(
      id: id, 
      title: title ?? this.title,
      dateTime: dateTime ?? this.dateTime,
      isDone: isDone ?? this.isDone,
    ); 
      
  }

  @override
  List<Object?> get props => [id, title, dateTime, isDone];

}