import 'package:healthy_mate/fitness_app/fitness_app_theme.dart';
import 'package:healthy_mate/global/router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Get.toNamed(MyRouter.info);
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      imageFlex: 4,
      bodyFlex: 2,
      footerFlex: 1,
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      infiniteAutoScroll: false,
      bodyPadding: const EdgeInsets.symmetric(horizontal: 10),
      pages: [
        PageViewModel(
          title: "Cá nhân hóa dành riêng cho bạn",
          body:
              "Ứng dụng di động cung cấp kế hoạch dinh dưỡng tùy chỉnh dựa trên sở thích ăn kiêng, mục tiêu sức khỏe và lối sống của bạn",
          image: _buildImage('introduction_animation/diet.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Tính toán lượng calo tiêu thụ mỗi ngày",
          body:
              "Dinh dưỡng hợp lý bắt đầu bằng việc biết bạn ăn gì. Ứng dụng của chúng tôi giúp bạn dễ dàng theo dõi lượng calo tiêu thụ hàng ngày     .",
          image: _buildImage('introduction_animation/healthy-food.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Thói quen lành mạnh bắt đầu từ đây",
          body:
              "Uống đủ nước và ngủ đủ giấc là điều cần thiết cho sức khỏe của bạn. ứng dụng của chúng tôi giúp bạn theo dõi lượng nước uống hàng ngày và kiểu ngủ.",
          image: _buildImage('introduction_animation/vegan.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Đi thôi !",
          body:
              "Cùng nhau kết nối, cùng nhau tạo nên một cộng đồng chia sẻ thân thiện và an toàn.",
          image: _buildImage('introduction_animation/man.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      showSkipButton: true, showNextButton: true, showDoneButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: FitnessAppTheme.nearlyDarkBlue,
          )),
      next: const Icon(
        Icons.arrow_forward,
        color: FitnessAppTheme.nearlyDarkBlue,
      ),
      done: const Text('Done',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: FitnessAppTheme.nearlyDarkBlue,
          )),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeColor: FitnessAppTheme.nearlyDarkBlue,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      // dotsContainerDecorator: const ShapeDecoration(
      //   color: Colors.white,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(8.0)),
      //   ),
      // ),
    );
  }
}
