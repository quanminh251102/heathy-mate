// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:healthy_mate/dtos/food_item_dto.dart';

class MealLogDto {
  String? id;
  String? type;
  List<FoodItemDto>? foodItemsDto;
  double? totalKcal;
  MealLogDto({
    this.id,
    this.type,
    this.foodItemsDto,
    this.totalKcal,
  });
}
