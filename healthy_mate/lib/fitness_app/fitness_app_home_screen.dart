import 'package:healthy_mate/fitness_app/models/tabIcon_data.dart';
import 'package:healthy_mate/fitness_app/screen/meal/meal_list_screen.dart';
import 'package:healthy_mate/fitness_app/screen/menu_screen/menu_screen.dart';
import 'package:healthy_mate/global/global_data.dart';
import 'package:healthy_mate/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../global/locator.dart';
import '../global/router.dart';
import 'bottom_navigation_view/bottom_bar_view.dart';
import 'fitness_app_theme.dart';
import 'my_diary/my_diary_screen.dart';

class FitnessAppHomeScreen extends StatefulWidget {
  const FitnessAppHomeScreen({super.key});

  @override
  _FitnessAppHomeScreenState createState() => _FitnessAppHomeScreenState();
}

class _FitnessAppHomeScreenState extends State<FitnessAppHomeScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  AnimationController? addFoodAnimationController;
  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: FitnessAppTheme.background,
  );

  @override
  void initState() {
    for (var tab in tabIconsList) {
      tab.isSelected = false;
    }
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    addFoodAnimationController = AnimationController(
        duration: const Duration(milliseconds: 601), vsync: this);
    tabBody = MyDiaryScreen(animationController: animationController);

    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FitnessAppTheme.background,
      child: Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 80, right: 10),
          child: ScaleTransition(
            alignment: Alignment.center,
            scale: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                parent: animationController!, curve: Curves.fastOutSlowIn)),
            child: Container(
              // alignment: Alignment.center,s
              decoration: BoxDecoration(
                color: FitnessAppTheme.nearlyDarkBlue,
                gradient: LinearGradient(colors: [
                  FitnessAppTheme.nearlyDarkBlue,
                  HexColor('#6A88E5'),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                shape: BoxShape.circle,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: FitnessAppTheme.nearlyDarkBlue.withOpacity(0.4),
                      offset: const Offset(8.0, 16.0),
                      blurRadius: 16.0),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.white.withOpacity(0.1),
                    highlightColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    onTap: () {
                      Get.toNamed(MyRouter.mealList,
                          arguments: addFoodAnimationController);
                    },
                    child: const Icon(
                      Icons.add,
                      color: FitnessAppTheme.white,
                      size: 32,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            tabBody,
            if (locator<GlobalData>().currentUser!.bmr != null) bottomBar(),
          ],
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            if (index == 0) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      MyDiaryScreen(animationController: animationController);
                });
              });
            } else if (index == 1 || index == 3) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      MenuScreen(animationController: animationController);
                });
              });
            } else {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      MealListScreen(animationController: animationController);
                });
              });
            }
          },
        ),
      ],
    );
  }
}
