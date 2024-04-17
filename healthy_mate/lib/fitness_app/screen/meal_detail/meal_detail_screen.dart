// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:healthy_mate/db/db_helper.dart';
import 'package:healthy_mate/dtos/meal_log_dto.dart';
import 'package:healthy_mate/fitness_app/fitness_app_theme.dart';
import 'package:healthy_mate/fitness_app/screen/info_screen/widget/title_view.dart';
import 'package:healthy_mate/fitness_app/screen/meal_detail/widget/food_list_view.dart';
import 'package:healthy_mate/fitness_app/screen/meal_detail/widget/nutrition_chart.dart';
import 'package:healthy_mate/fitness_app/screen/meal_detail/widget/training_plan.dart';
import 'package:healthy_mate/global/global_data.dart';
import 'package:healthy_mate/global/locator.dart';
import 'package:healthy_mate/view_models/interfaces/iauth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class MealDetailScreen extends StatefulWidget {
  final MealLogDto mealLogDto;
  const MealDetailScreen({
    super.key,
    required this.mealLogDto,
  });

  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen>
    with TickerProviderStateMixin {
  late IAuthViewModel _authViewModel;
  Animation<double>? topBarAnimation;
  AnimationController? animationController;
  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    _authViewModel = context.read<IAuthViewModel>();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: animationController!,
            curve: const Interval(0, 0.5, curve: Curves.fastOutSlowIn)));

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    animationController?.forward();
    Future.delayed(
      Duration.zero,
      () async {
        await DbHelper.instance.addUser(locator<GlobalData>().currentUser!);
      },
    );
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FitnessAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            getMainListViewUI(),
            getAppBarUI(),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  Widget getMainListViewUI() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: AppBar().preferredSize.height +
              MediaQuery.of(context).padding.top +
              24,
          bottom: 62 + MediaQuery.of(context).padding.bottom,
        ),
        child: Column(
          children: [
            InfoTitleView(
              titleTxt: 'Thành phần dinh dưỡng',
              animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                      parent: animationController!,
                      curve: const Interval((1 / 9) * 0, 1.0,
                          curve: Curves.fastOutSlowIn))),
              animationController: animationController!,
            ),
            NutritionChart(
              mealLogDto: widget.mealLogDto,
              animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                      parent: animationController!,
                      curve: const Interval((1 / 9) * 1, 1.0,
                          curve: Curves.fastOutSlowIn))),
              animationController: animationController!,
            ),
            InfoTitleView(
              titleTxt:
                  'Kế hoạch tập luyện để tiêu hao ${widget.mealLogDto.totalKcal.toString()} Kcal',
              animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: animationController!,
                  curve: const Interval(
                    (1 / 9) * 0,
                    1.0,
                    curve: Curves.fastOutSlowIn,
                  ),
                ),
              ),
              animationController: animationController!,
            ),
            TrainingPlan(
              mealLogDto: widget.mealLogDto,
              animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                      parent: animationController!,
                      curve: const Interval((1 / 9) * 1, 1.0,
                          curve: Curves.fastOutSlowIn))),
              animationController: animationController!,
            ),
            InfoTitleView(
              titleTxt: 'Món ăn ${widget.mealLogDto.type!.toLowerCase()}',
              animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: animationController!,
                  curve: const Interval(
                    (1 / 9) * 0,
                    1.0,
                    curve: Curves.fastOutSlowIn,
                  ),
                ),
              ),
              animationController: animationController!,
            ),
            FoodListView(
              mealLogDto: widget.mealLogDto,
              animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                      parent: animationController!,
                      curve: const Interval((1 / 9) * 1, 1.0,
                          curve: Curves.fastOutSlowIn))),
              animationController: animationController!,
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
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
                                widget.mealLogDto.type.toString(),
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
