// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:healthy_mate/fitness_app/fitness_app_theme.dart';
import 'package:healthy_mate/main.dart';
import 'package:healthy_mate/view_models/interfaces/iauth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class GoalScreen extends StatefulWidget {
  const GoalScreen({super.key});

  @override
  _GoalScreenState createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> with TickerProviderStateMixin {
  late IAuthViewModel _authViewModel;
  Animation<double>? topBarAnimation;
  AnimationController? animationController;
  List<Widget> listViews = <Widget>[];
  double topBarOpacity = 0.0;
  int selectedType = 0;
  @override
  void initState() {
    _authViewModel = context.read<IAuthViewModel>();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: animationController!,
            curve: const Interval(0, 0.5, curve: Curves.fastOutSlowIn)));

    animationController?.forward();

    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: FitnessAppTheme.background,
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Mục tiêu của bạn là gì ?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: FitnessAppTheme.nearlyDarkBlue,
                    fontSize: 24,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: GoalTile(
                      selectIndex: (value) {
                        selectedType = value;
                      },
                    )),
                const SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () async {
                    String goal = selectedType == 0
                        ? 'lose'
                        : selectedType == 1
                            ? 'maintain'
                            : 'gain';
                    await _authViewModel.setBMR(goal);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: FitnessAppTheme.nearlyDarkBlue,
                      gradient: LinearGradient(colors: [
                        FitnessAppTheme.nearlyDarkBlue,
                        HexColor('#6A88E5'),
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    ),
                    width: 200,
                    height: 40,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Tiếp tục',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 15,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            getAppBarUI(),
          ],
        ));
  }

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: animationController!,
          builder: (BuildContext context, Widget? child) {
            return FadeTransition(
              opacity: topBarAnimation!,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - topBarAnimation!.value), 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FitnessAppTheme.white.withOpacity(topBarOpacity),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: FitnessAppTheme.grey
                              .withOpacity(0.4 * topBarOpacity),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16 - 8.0 * topBarOpacity,
                            bottom: 12 - 8.0 * topBarOpacity),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              width: 30,
                              child: InkWell(
                                  onTap: () => Get.back(),
                                  child: const Icon(Icons.arrow_back_ios)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Mục tiêu',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: FitnessAppTheme.fontName,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22 + 6 - 6 * topBarOpacity,
                                  letterSpacing: 1.2,
                                  color: FitnessAppTheme.darkerText,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}

class GoalTile extends StatefulWidget {
  final Function(int) selectIndex;
  const GoalTile({
    super.key,
    required this.selectIndex,
  });
  @override
  State<GoalTile> createState() => _GoalTileState();
}

class _GoalTileState extends State<GoalTile> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<String> title = [
      'Giảm cân',
      'Giữ nguyên cân nặng',
      'Tăng cân',
    ];
    List<String> subtitle = [
      'Giảm cân bằng cách ăn uống thông minh',
      'Tối ưu cho sức khỏe của bạn',
      'Tăng cân với eat clean',
    ];
    List<String> imagePath = [
      'assets/fitness_app/lose_weight.png',
      'assets/fitness_app/diabetes.png',
      'assets/fitness_app/bicep.png',
    ];
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            setState(() {
              selectedIndex = index;
              widget.selectIndex(selectedIndex);
            });
          },
          child: GoalCard(
            title: title[index],
            subtitle: subtitle[index],
            imagePath: imagePath[index],
            isSelected: selectedIndex == index,
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 15,
        );
      },
      itemCount: 3,
    );
  }
}

class GoalCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final bool isSelected;

  const GoalCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.isSelected,
  });

  @override
  State<GoalCard> createState() => _GoalCardState();
}

class _GoalCardState extends State<GoalCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: FitnessAppTheme.nearlyDarkBlue.withOpacity(
        0.2,
      ),
      child: Container(
        width: double.infinity,
        height: 110,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            20,
          ),
          border: Border.all(
            color: widget.isSelected
                ? FitnessAppTheme.nearlyDarkBlue
                : Colors.white,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Image.asset(widget.imagePath),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: widget.isSelected
                          ? FitnessAppTheme.nearlyDarkBlue
                          : Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 240,
                    child: Text(
                      widget.subtitle,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
