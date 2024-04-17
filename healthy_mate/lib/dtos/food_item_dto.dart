// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

part 'food_item_dto.g.dart';

@embedded
class FoodPortion {
  String? portionName;
  int? portionSize;

  FoodPortion({this.portionName, this.portionSize});

  Map<String, dynamic> toJson() {
    return {
      'portionName': portionName,
      'portionSize': portionSize,
    };
  }

  factory FoodPortion.fromJson(Map<String, dynamic> json) {
    return FoodPortion(
      portionName: json['portionName'],
      portionSize: json['portionSize'],
    );
  }
}

@embedded
class NutritionalInfo {
  int? averageValue;
  double? kcal;
  double? fat;
  double? carbs;
  double? protein;

  NutritionalInfo({
    this.averageValue,
    this.kcal,
    this.fat,
    this.carbs,
    this.protein,
  });

  Map<String, dynamic> toJson() {
    return {
      'averageValue': averageValue,
      'kcal': kcal,
      'fat': fat,
      'carbs': carbs,
      'protein': protein,
    };
  }

  factory NutritionalInfo.fromJson(Map<String, dynamic> json) {
    return NutritionalInfo(
      averageValue: json['averageValue'],
      kcal: json['kcal'].toDouble(),
      fat: json['fat'],
      carbs: json['carbs'],
      protein: json['protein'],
    );
  }
}

@Collection()
class FoodItemDto {
  Id? id = Isar.autoIncrement;
  String? name;
  FoodPortion? portion;
  NutritionalInfo? nutritionalInfo;
  FoodItemDto({
    this.id,
    this.name,
    this.portion,
    this.nutritionalInfo,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'portion': portion?.toJson(),
      'nutritionalInfo': nutritionalInfo?.toJson(),
    };
  }

  factory FoodItemDto.fromJson(Map<String, dynamic> json) {
    return FoodItemDto(
        name: json['name'],
        portion: json['portion'] == null
            ? null
            : FoodPortion.fromJson(json['portion'] as Map<String, dynamic>),
        nutritionalInfo: json['nutritionalInfo'] == null
            ? null
            : NutritionalInfo.fromJson(
                json['nutritionalInfo'] as Map<String, dynamic>));
  }
}
