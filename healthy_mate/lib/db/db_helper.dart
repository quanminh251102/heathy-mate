import 'package:healthy_mate/dtos/account_dto.dart';
import 'package:healthy_mate/dtos/daily_food_log_dto.dart';
import 'package:healthy_mate/dtos/food_item_dto.dart';
import 'package:healthy_mate/dtos/meal_dto.dart';
import 'package:healthy_mate/global/global_data.dart';
import 'package:healthy_mate/global/locator.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class DbHelper {
  DbHelper._privateConstructor();
  static final DbHelper instance = DbHelper._privateConstructor();
  late Isar _isar;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [AccountDtoSchema, DailyFoodLogSchema, FoodItemDtoSchema, MealDtoSchema],
      directory: dir.path,
    );
  }

  Future<int> addDailyFoodLog(DailyFoodLog log) async {
    return _isar.writeTxn(() => _isar.dailyFoodLogs.put(log));
  }

  Future<void> deleteDailyFoodLog(int id) async {
    await _isar.writeTxn(() => _isar.dailyFoodLogs.delete(id));
  }

  Future<void> updateDailyFoodLog(DailyFoodLog log) async {
    await _isar.writeTxn(() => _isar.dailyFoodLogs.put(log));
  }

  Future<List<DailyFoodLog>> getAllDailyFoodLogs() async {
    return _isar.dailyFoodLogs.where().findAll();
  }

  Future<DailyFoodLog?> getDailyFoodLogById(int id) async {
    return _isar.dailyFoodLogs.get(id);
  }

  Future<DailyFoodLog?> getDailyFoodLogByDateAndUser(DateTime date) async {
    final startDate = DateTime(date.year, date.month, date.day);
    final endDate = DateTime(date.year, date.month, date.day, 23, 59, 59);

    return _isar.dailyFoodLogs
        .filter()
        .dateBetween(startDate, endDate)
        .findFirst();
  }

  Future<void> addFoodItemToMealByType(
      String mealType, FoodItemDto foodItem) async {
    final currentDate = DateTime.now();
    final startDate =
        DateTime(currentDate.year, currentDate.month, currentDate.day);
    final endDate = DateTime(
        currentDate.year, currentDate.month, currentDate.day, 23, 59, 59);

    final dailyFoodLog = await _isar.dailyFoodLogs
        .filter()
        .dateBetween(startDate, endDate)
        .findFirst();

    if (dailyFoodLog != null) {
      MealDto? mealDto = dailyFoodLog.listMeal.firstWhere(
          (element) => element.type == mealType,
          orElse: () => MealDto(type: mealType));

      await _isar.writeTxn(() async {
        await _isar.foodItemDtos.put(foodItem);
        await _isar.mealDtos.put(mealDto);
        mealDto.listFoodDto.add(foodItem);
        await mealDto.listFoodDto.save();
        dailyFoodLog.listMeal.add(mealDto);
        await _isar.dailyFoodLogs.put(dailyFoodLog);
        await dailyFoodLog.listMeal.save();
      });
    }
    EasyLoading.showSuccess('Thêm món ăn thành công');
  }

  Future<void> changeWaterIntake(bool isIncrease) async {
    final currentDate = locator<GlobalData>().currentDateTime;
    final startDate =
        DateTime(currentDate.year, currentDate.month, currentDate.day);
    final endDate = DateTime(
        currentDate.year, currentDate.month, currentDate.day, 23, 59, 59);

    final dailyFoodLog = await _isar.dailyFoodLogs
        .filter()
        .dateBetween(startDate, endDate)
        .findFirst();

    if (isIncrease) {
      dailyFoodLog!.waterIntake = 100 + dailyFoodLog.waterIntake!;
    } else {
      if (dailyFoodLog!.waterIntake! > 100) {
        dailyFoodLog.waterIntake = dailyFoodLog.waterIntake! - 100;
      }
    }
    dailyFoodLog.lastDrinkTime = DateTime.now();
    await _isar.writeTxn(() => _isar.dailyFoodLogs.put(dailyFoodLog));
  }

  Future<void> addUser(AccountDto user) async {
    await _isar.writeTxn(() async {
      await _isar.accountDtos.put(user);
    });
  }

  Future<List<AccountDto>> getAllUsers() async {
    return _isar.accountDtos.where().findAll();
  }

  Future<AccountDto?> getUserById(int id) async {
    return _isar.accountDtos.get(id);
  }

  Future<void> updateUser(String email, String name, String phoneNumber) async {
    locator<GlobalData>().currentUser!.firstName = name;
    locator<GlobalData>().currentUser!.email = email;
    locator<GlobalData>().currentUser!.phoneNumber = phoneNumber;
    await _isar.writeTxn(() async {
      await _isar.accountDtos.put(locator<GlobalData>().currentUser!);
    });
  }

  Future<void> deleteUser(int id) async {
    await _isar.writeTxn(() async {
      await _isar.accountDtos.delete(id);
    });
  }

  //food Item

  // Future<int> insertFoodItem(FoodItem foodItem) async {
  //   // Thêm một FoodItem mới vào cơ sở dữ liệu
  //   return _isar.writeTxn(() async => await _isar.foodItems.put(foodItem));
  // }

  // Future<void> deleteFoodItem(int id) async {
  //   // Xóa một FoodItem khỏi cơ sở dữ liệu dựa trên ID
  //   await _isar.writeTxn(() async => await _isar.foodItems.delete(id));
  // }

  // Future<void> updateFoodItem(FoodItem foodItem) async {
  //   // Cập nhật một FoodItem
  //   await _isar.writeTxn(() async => await _isar.foodItems.put(foodItem));
  // }

  // Future<List<FoodItem>> getAllFoodItems() async {
  //   // Lấy tất cả FoodItem
  //   return _isar.foodItems.where().findAll();
  // }

  // Future<FoodItem?> getFoodItemById(int id) async {
  //   // Lấy một FoodItem dựa trên ID
  //   return _isar.foodItems.get(id);
  // }
}
