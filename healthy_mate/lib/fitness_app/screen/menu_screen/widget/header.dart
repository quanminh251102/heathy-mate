// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../menu_screen.dart';

class _Header extends StatefulWidget {
  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;
  const _Header({
    this.mainScreenAnimationController,
    this.mainScreenAnimation,
  });
  @override
  State<_Header> createState() => _HeaderState();
}

class _HeaderState extends State<_Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: FitnessAppTheme.nearlyDarkBlue.withOpacity(
          0.8,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            20,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
      child: Column(
        children: [
          Lottie.asset(
            "assets/images/avatar.json",
            animate: true,
            repeat: true,
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            children: [
              // Text.rich(TextSpan(children: [
              //   TextSpan(
              //       text: 'Trạng thái: ',
              //       style: TextStyle(
              //         fontSize: 14,
              //         color: Colors.white,
              //         fontWeight: FontWeight.bold,
              //       )),
              //   TextSpan(
              //       text: 'Đã đăng nhập',
              //       style: TextStyle(
              //         fontSize: 14,
              //         color: Colors.white,
              //         fontWeight: FontWeight.bold,
              //       )),
              // ])),
              // SizedBox(
              //   height: 5,
              // ),
              Text(locator<GlobalData>().currentUser?.firstName ?? '',
                  style: const TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
