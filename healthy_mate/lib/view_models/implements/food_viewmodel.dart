import 'package:healthy_mate/db/db_helper.dart';
import 'package:healthy_mate/dtos/daily_food_log_dto.dart';
import 'package:healthy_mate/dtos/food_item_dto.dart';
import 'package:healthy_mate/dtos/meal_dto.dart';
import 'package:healthy_mate/dtos/meal_index_dto.dart';
import 'package:healthy_mate/dtos/meal_log_dto.dart';
import 'package:healthy_mate/global/global_data.dart';
import 'package:healthy_mate/global/locator.dart';
import 'package:healthy_mate/view_models/interfaces/ifood_viewmodel.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class FoodViewModel with ChangeNotifier implements IFoodViewModel {
  List<FoodItemDto> _listFood = [];
  DailyFoodLog? _currentDaily;

  String? _currentMealType;
  DailyFoodLog? _dailyFoodLog;
  List<MealDto> _listMeal = [];
  final List<FoodItemDto> _foodItemDto = [];
  List<MealLogDto> _listMealLog = [];
  MealIndexDto? _currentMealIndex;
  double? _totalKcalEat;
  Widget? _currentTabBody;
  @override
  Widget? get currentTabBody => _currentTabBody;
  @override
  set setCurrentTabBody(Widget currentTabBody) {
    _currentTabBody = currentTabBody;
  }

  @override
  set changeTab(Widget currentTabBody) {
    _currentTabBody = currentTabBody;
    notifyListeners();
  }

  @override
  MealIndexDto? get currentMealIndex => _currentMealIndex;
  @override
  List<MealLogDto> get listMealLog => _listMealLog;
  @override
  List<MealDto>? get listMeal => _listMeal;
  @override
  List<FoodItemDto>? get foodItemDto => _foodItemDto;
  @override
  double? get totalKcalEat => _totalKcalEat;
  @override
  String? get currentMealType => _currentMealType;
  @override
  set setCurrentMealType(String currentMealType) {
    _currentMealType = currentMealType;
    notifyListeners();
  }

  @override
  DailyFoodLog? get dailyFoodLog => _dailyFoodLog;
  @override
  List<FoodItemDto> get listFood => _listFood;

  @override
  Future<void> loadFoodItems() async {
    final String data =
        await rootBundle.loadString('assets/data/meal_data.json');
    final List<dynamic> jsonResult = json.decode(data);
    List<FoodItemDto> result =
        jsonResult.map((item) => FoodItemDto.fromJson(item)).toList();
    _listFood = result;
    notifyListeners();
  }

  @override
  Future<void> searchFoodItems(String keyword) async {
    if (keyword.isNotEmpty) {
      _listFood = _listFood
          .where(
            (element) => element.name!.toLowerCase().contains(
                  keyword,
                ),
          )
          .toList();
    } else {
      await loadFoodItems();
    }
    notifyListeners();
  }

  @override
  Future<void> fetchFoodLog() async {
    DailyFoodLog? dailyFoodLog = await DbHelper.instance
        .getDailyFoodLogByDateAndUser(locator<GlobalData>().currentDateTime);
    _dailyFoodLog = dailyFoodLog;
    _dailyFoodLog!.totalKcal = 0;
    await _dailyFoodLog!.listMeal.load();
    _listMeal = _dailyFoodLog!.listMeal.toList();
    _listMealLog = [];
    for (var meal in _listMeal) {
      await meal.listFoodDto.load();
      _listMealLog.add(
        MealLogDto(
          id: meal.id.toString(),
          type: meal.type,
          foodItemsDto: meal.listFoodDto.toList(),
        ),
      );
    }
    for (var mealLog in _listMealLog) {
      mealLog.totalKcal = 0;
      for (var food in mealLog.foodItemsDto!) {
        mealLog.totalKcal = mealLog.totalKcal! + food.nutritionalInfo!.kcal!;
      }
      _dailyFoodLog!.totalKcal = _dailyFoodLog!.totalKcal + mealLog.totalKcal!;
    }
    notifyListeners();
  }

  @override
  Future<void> getFoodLogByDay(DateTime date) async {
    DailyFoodLog? dailyFoodLog =
        await DbHelper.instance.getDailyFoodLogByDateAndUser(date);

    if (dailyFoodLog == null) {
      await DbHelper.instance.addDailyFoodLog(
        DailyFoodLog(
          date: date,
          userId: locator<GlobalData>().currentUser!.id!.toString(),
          waterIntake: 0,
        ),
      );
      _dailyFoodLog = DailyFoodLog();
      _listMeal = [];
      _listMealLog = [];
    } else {
      _listMeal = [];
      _listMealLog = [];
      _dailyFoodLog = dailyFoodLog;
      _dailyFoodLog!.totalKcal = 0;
      await _dailyFoodLog!.listMeal.load();
      _listMeal = _dailyFoodLog!.listMeal.toList();
      for (var meal in _listMeal) {
        await meal.listFoodDto.load();
        _listMealLog.add(
          MealLogDto(
            id: meal.id.toString(),
            type: meal.type,
            foodItemsDto: meal.listFoodDto.toList(),
          ),
        );
      }
      for (var mealLog in _listMealLog) {
        mealLog.totalKcal = 0;
        for (var food in mealLog.foodItemsDto!) {
          mealLog.totalKcal = mealLog.totalKcal! + food.nutritionalInfo!.kcal!;
        }
        _dailyFoodLog!.totalKcal =
            _dailyFoodLog!.totalKcal + mealLog.totalKcal!;
      }
    }
    notifyListeners();
  }
}
