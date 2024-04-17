import 'package:healthy_mate/common_widget/AppLogo/app_logo.dart';
import 'package:healthy_mate/fitness_app/fitness_app_theme.dart';
import 'package:healthy_mate/fitness_app/screen/DarkBackground/darkRadialBackground.dart';
import 'package:healthy_mate/global/router.dart';
import 'package:healthy_mate/view_models/interfaces/iauth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

class _SplashScreenState extends State<SplashScreen> {
  late IAuthViewModel _authViewModel;
  @override
  void initState() {
    _authViewModel = context.read<IAuthViewModel>();
    super.initState();
    Future.delayed(
      Duration.zero,
      () async {
        await Future.delayed(const Duration(seconds: 2));
        if (await _authViewModel.fetchData()) {
          Get.toNamed(MyRouter.home);
        } else {
          Get.toNamed(MyRouter.onBoarding);
        }
      },
    );
  }

  final Shader linearGradient = LinearGradient(
    begin: FractionalOffset.topCenter,
    colors: <Color>[HexColor.fromHex("#a7b2fd"), HexColor.fromHex("#c1a0fd")],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 30.0, 40.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        DarkRadialBackground(
          color: Colors.white,
          position: "topLeft",
        ),
        const Positioned(left: 140, child: AppLogo()),
        Center(
            child: Container(
          child: RichText(
            text: const TextSpan(
              text: 'Healthy',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'mate',
                  style: TextStyle(
                    // foreground: Paint()..shader = linearGradient,
                    fontWeight: FontWeight.bold,
                    color: FitnessAppTheme.nearlyDarkBlue,
                  ),
                ),
              ],
            ),
          ),
        ))
        // DarkRadialBackground(
        //   color: Colors.transparent,
        //   position: "bottomRight",
        // ),
      ]),
    );
  }
}
