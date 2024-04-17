import 'package:healthy_mate/db/db_helper.dart';
import 'package:healthy_mate/dtos/account_dto.dart';
import 'package:healthy_mate/global/global_data.dart';
import 'package:healthy_mate/global/locator.dart';
import 'package:healthy_mate/global/router.dart';
import 'package:healthy_mate/view_models/interfaces/iauth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthViewModel with ChangeNotifier implements IAuthViewModel {
  @override
  Future<bool> fetchData() async {
    List<AccountDto> listAccount = await DbHelper.instance.getAllUsers();
    if (listAccount.isNotEmpty) {
      locator<GlobalData>().currentUser = listAccount[0];
      return true;
    }
    locator<GlobalData>().currentUser = AccountDto();
    return false;
  }

  double calculateBMR(
      String gender, double weight, double height, int age, String goal) {
    double bmr;
    if (gender == 'male') {
      bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
    } else {
      bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
    }
    switch (goal) {
      case 'lose':
        bmr *= 0.80;
        break;
      case 'gain':
        bmr *= 1.15;
        break;
      case 'maintain':
      default:
        break;
    }
    locator<GlobalData>().currentUser!.goal = goal;
    return bmr;
  }

  double calculateBMI(
    double weight,
    double height,
  ) {
    double heightInMeters = height / 100;
    return weight / (heightInMeters * heightInMeters);
  }

  @override
  Future<void> setBMR(String goal) async {
    String gender = locator<GlobalData>().currentUser!.gender!;
    double weight = locator<GlobalData>().currentUser!.weight!;
    double height = locator<GlobalData>().currentUser!.height!;
    int age = locator<GlobalData>().currentUser!.age!;
    locator<GlobalData>().currentUser!.bmr = calculateBMR(
      gender,
      weight,
      height,
      age,
      goal,
    );
    locator<GlobalData>().currentUser!.bmi = calculateBMI(weight, height);
    locator<GlobalData>().currentUser!.updateTime =
        DateTime.now().toIso8601String();
    await DbHelper.instance.addUser(locator<GlobalData>().currentUser!);
    Get.toNamed(MyRouter.statistic);
  }

  @override
  Future<void> login(String phone, String password) async {}

  @override
  Future<void> logout() async {
    notifyListeners();
  }

  @override
  Future<void> signUp(String email, String name, String password) async {
    notifyListeners();
  }
  // @override
  // Future<void> init() async {
  //   var logined = await _iAuthService.checkLogin();

  //   if (logined) {
  //     Get.offNamed(MyRouter.home);
  //   } else {
  //     Get.offNamed(MyRouter.login);
  //   }
  // }

  // @override
  // Future<void> changePassword(
  //     String currentPassword, String newPassword) async {
  //   bool result =
  //       await _iAuthService.changePassword(currentPassword, newPassword);
  //   if (result) {
  //     EasyLoading.showSuccess("Đổi mật khẩu thành công!");
  //
  //     Get.offNamed(MyRouter.login);
  //   } else {
  //     EasyLoading.showError("Đổi mật khẩu thất bại!");
  //   }
  // }

  // @override
  // Future<void> updateAvatar(UploadFileDto file) async {
  //   var upload = await _iAuthService.updateAvatar(file);
  //   if (upload) {
  //     getProfile();
  //   }
  // }

  // @override
  // Future<bool> confirmCode(String code, int? userId) async {
  //   var result = await _iAuthService.confirmCode(code, _currentUserId!);
  //   return result;
  // }

  // @override
  // Future<bool> reSendConfirmCode(int typeId) async {
  //   var result = true;
  //   //  await _iAuthService.reSendConfirmCode(_currentUserId!, typeId);
  //   // if (result) {
  //   //   await EasyLoading.showSuccess('Đã gửi lại!');
  //   // }
  //   return result;
  // }

  // @override
  // Future<bool> forgotPassword(String emailOrPhone) async {
  //   var result = await _iAuthService.forgotPassword(emailOrPhone);
  //   if (result != null) {
  //     if (result.success == true) {
  //       _currentUserId = result.result!.userId;
  //       await EasyLoading.showSuccess('Mã xác nhận đã được gửi!');
  //       return true;
  //     }
  //   }
  //   return false;
  // }

  // @override
  // Future<void> resetPassword(String newPassword) async {
  //   var result =
  //       await _iAuthService.resetPassword(_currentUserId!, newPassword);
  //   if (result) {
  //     await EasyLoading.showSuccess('Đổi mật khẩu thành công!');
  //     Get.offNamed(MyRouter.login);
  //   }
  // }

  // @override
  // Future<void> getProfile({bool showLoading = true}) async {
  //   await _iAuthService.getProfile(
  //     showLoading: showLoading,
  //   );
  //   _profile = locator<GlobalData>().currentUser;
  //   notifyListeners();
  // }
}
