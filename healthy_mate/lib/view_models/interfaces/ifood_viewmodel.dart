import 'package:healthy_mate/dtos/daily_food_log_dto.dart';
import 'package:healthy_mate/dtos/food_item_dto.dart';
import 'package:healthy_mate/dtos/meal_dto.dart';
import 'package:healthy_mate/dtos/meal_index_dto.dart';
import 'package:healthy_mate/dtos/meal_log_dto.dart';
import 'package:flutter/material.dart';

abstract class IFoodViewModel implements ChangeNotifier {
  List<FoodItemDto> get listFood;
  DailyFoodLog? get dailyFoodLog;
  List<MealDto>? get listMeal;
  List<FoodItemDto>? get foodItemDto;
  List<MealLogDto> get listMealLog;
  MealIndexDto? get currentMealIndex;
  String? get currentMealType;
  Widget? get currentTabBody;
  set setCurrentTabBody(Widget currentTabBody);
  set changeTab(Widget currentTabBody);
  double? get totalKcalEat;
  set setCurrentMealType(String currentMealType);
  Future<void> loadFoodItems();
  Future<void> searchFoodItems(String keyword);
  Future<void> fetchFoodLog();
  Future<void> getFoodLogByDay(DateTime date);
}
