
import 'package:healthy_mate/dtos/food_item_dto.dart';
import 'package:isar/isar.dart';

part 'meal_dto.g.dart';

@Collection()
class MealDto {
  Id? id = Isar.autoIncrement;
  var listFoodDto = IsarLinks<FoodItemDto>();
  String? type;

  MealDto({
    this.id,
    this.type,
  });
}
