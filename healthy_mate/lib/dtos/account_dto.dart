// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';
part 'account_dto.g.dart'; // Isar generates this part file

@Collection()
class AccountDto {
  Id? id = Isar.autoIncrement;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? avatarUrl;
  String? phoneNumber;
  String? gender;
  String? goal;
  double? weight;
  double? height;
  double? bmr;
  double? bmi;
  String? updateTime;
  String? imagePath;
  int? age;
  AccountDto({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.avatarUrl,
    this.phoneNumber,
    this.gender,
    this.weight,
    this.height,
    this.bmr,
    this.goal,
    this.bmi,
    this.updateTime,
    this.age,
  });
}
