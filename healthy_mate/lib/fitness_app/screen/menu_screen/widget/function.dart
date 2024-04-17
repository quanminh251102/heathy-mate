// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../menu_screen.dart';

class _Function extends StatefulWidget {
  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;
  const _Function({
    this.mainScreenAnimationController,
    this.mainScreenAnimation,
  });

  @override
  State<_Function> createState() => _FunctionState();
}

class _FunctionState extends State<_Function> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: Text(
              'Cài đặt',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: FitnessAppTheme.nearlyDarkBlue,
                fontSize: 19,
              ),
            ),
          ),
          if (locator<GlobalData>().currentUser != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _FunctionItem(
                  icon: 'logout.png',
                  onTap: () async {
                    showDialog(
                      context: context,
                      builder: (context) => const UpdateUserScreen(),
                    );
                  },
                  title: 'Cập nhật thông tin cá nhân',
                ),
                _FunctionItem(
                  icon: 'logout.png',
                  onTap: () {
                    Get.toNamed(MyRouter.goal);
                  },
                  title: 'Cập nhật mục tiêu',
                ),
                _FunctionItem(
                  icon: 'logout.png',
                  onTap: () async {
                    // await context.read<IAuthViewModel>().logout();
                  },
                  title: 'Đăng xuất',
                ),
              ],
            )
        ],
      ),
    );
  }
}

class _FunctionItem extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final String title;
  final Function() onTap;
  final String icon;
  const _FunctionItem({
    Key? key,
    this.borderRadius,
    required this.title,
    required this.onTap,
    required this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10,
            ),
            color: FitnessAppTheme.nearlyDarkBlue.withOpacity(
              0.8,
            ),
            border: const Border(
              top: BorderSide(
                color: Color(
                  0xFF3b3f46,
                ),
              ),
            ),
          ),
          height: 40,
          width: double.infinity,
          child: Row(
            children: [
              // Image.asset(
              //   'assets/icons/$icon',
              //   color: FitnessAppTheme.nearlyDarkBlue,
              //   width: 25,
              // ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: FitnessAppTheme.white,
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}
