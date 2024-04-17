// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:healthy_mate/dtos/meal_dto.dart';
import 'package:isar/isar.dart';

part 'daily_food_log_dto.g.dart';

@Collection()
class DailyFoodLog {
  Id? id = Isar.autoIncrement;
  String? userId;
  var listMeal = IsarLinks<MealDto>();
  DateTime? date;
  int? waterIntake;
  DateTime? lastDrinkTime;
  double totalKcal;
  DailyFoodLog({
    this.id,
    this.userId,
    this.date,
    this.lastDrinkTime,
    this.waterIntake = 0,
    this.totalKcal = 0,
  });
}
