import 'package:healthy_mate/db/db_helper.dart';
import 'package:healthy_mate/fitness_app/fitness_app_theme.dart';
import 'package:healthy_mate/global/locator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/global_data.dart';

class UpdateUserScreen extends StatefulWidget {
  const UpdateUserScreen({super.key});

  @override
  State<UpdateUserScreen> createState() => _UpdateUserScreenState();
}

class _UpdateUserScreenState extends State<UpdateUserScreen> {
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController nameController;

  final GlobalKey<FormState> _formKeyEmail = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyPassword = GlobalKey<FormState>();

  final GlobalKey<FormState> _formKeyName = GlobalKey<FormState>();

  final FocusNode _focusEmail = FocusNode();
  final FocusNode _focusName = FocusNode();
  final FocusNode _focusPassword = FocusNode();

  void _onFocusPhone() {
    if (!_focusEmail.hasFocus) _formKeyEmail.currentState?.validate();
  }

  void _onFocusName() {
    if (!_focusName.hasFocus) _formKeyName.currentState?.validate();
  }

  void _onFocusPassword() {
    if (!_focusPassword.hasFocus) _formKeyPassword.currentState?.validate();
  }

  Future<void> doSignUp() async {
    if (_formKeyEmail.currentState?.validate() == true &&
        _formKeyName.currentState?.validate() == true &&
        _formKeyPassword.currentState?.validate() == true) {
      await DbHelper.instance
          .updateUser(emailController.value.text, nameController.value.text,
              phoneController.value.text)
          .then((value) => Get.back());
    } else {
      _formKeyName.currentState?.validate();
      _formKeyPassword.currentState?.validate();
    }
  }

  IconData icon = Icons.visibility_off;
  bool _hidePassword = true;
  void showPass() {
    setState(() {
      _hidePassword = !_hidePassword;
      icon = _hidePassword ? Icons.visibility_off : Icons.visibility;
    });
  }

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(
        text: locator<GlobalData>().currentUser!.email ?? '');
    phoneController = TextEditingController(
        text: locator<GlobalData>().currentUser!.phoneNumber ?? '');
    nameController = TextEditingController(
        text: locator<GlobalData>().currentUser!.firstName ?? '');

    _focusEmail.addListener(_onFocusPhone);
    _focusName.addListener(_onFocusName);
    _focusPassword.addListener(_onFocusPassword);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    phoneController.dispose();
    nameController.dispose();

    _focusEmail.removeListener(_onFocusPhone);
    _focusName.removeListener(_onFocusName);
    _focusPassword.removeListener(_onFocusPassword);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 400,
        // decoration: const BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage(
        //           'assets/images/bg_login.png',
        //         ),
        //         fit: BoxFit.fill)),
        padding: const EdgeInsets.only(
          right: 24,
          left: 24,
          top: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Cập nhật thông tin',
              style: TextStyle(
                color: FitnessAppTheme.nearlyDarkBlue,
                // color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 350,
                  child: Form(
                    key: _formKeyName,
                    child: TextField(
                      controller: nameController,
                      focusNode: _focusName,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                        ),
                        hintText: 'Họ và tên',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 350,
                  child: Form(
                    key: _formKeyEmail,
                    child: TextField(
                      controller: emailController,
                      focusNode: _focusEmail,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 350,
                  child: Form(
                    key: _formKeyPassword,
                    child: TextField(
                      controller: phoneController,
                      focusNode: _focusPassword,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.phone,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'Cập nhật',
                      style: TextStyle(
                        color: FitnessAppTheme.nearlyDarkBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () => doSignUp(),
                      child: const CircleAvatar(
                        radius: 10,
                        backgroundColor: FitnessAppTheme.nearlyDarkBlue,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 8,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
