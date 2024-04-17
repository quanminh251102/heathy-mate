import 'package:healthy_mate/dtos/meal_log_dto.dart';
import 'package:healthy_mate/fitness_app/fitness_app_theme.dart';
import 'package:healthy_mate/fitness_app/models/meals_list_data.dart';
import 'package:healthy_mate/global/router.dart';
import 'package:healthy_mate/main.dart';
import 'package:healthy_mate/view_models/interfaces/ifood_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class MealsListView extends StatefulWidget {
  const MealsListView(
      {super.key,
      this.mainScreenAnimationController,
      this.mainScreenAnimation});

  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;

  @override
  _MealsListViewState createState() => _MealsListViewState();
}

class _MealsListViewState extends State<MealsListView>
    with TickerProviderStateMixin {
  late IFoodViewModel _iFoodViewModel;
  AnimationController? animationController;
  List<MealsListData> mealsListData = MealsListData.tabIconsList;

  @override
  void initState() {
    _iFoodViewModel = context.read<IFoodViewModel>();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);

    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<IFoodViewModel>(builder: (context, vm, child) {
      return AnimatedBuilder(
        animation: widget.mainScreenAnimationController!,
        builder: (BuildContext context, Widget? child) {
          return FadeTransition(
            opacity: widget.mainScreenAnimation!,
            child: Transform(
              transform: Matrix4.translationValues(
                  0.0, 30 * (1.0 - widget.mainScreenAnimation!.value), 0.0),
              child: SizedBox(
                height: 216,
                width: double.infinity,
                child: ListView.builder(
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 0, right: 16, left: 16),
                  itemCount: mealsListData.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    final int count =
                        mealsListData.length > 10 ? 10 : mealsListData.length;
                    final Animation<double> animation =
                        Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: animationController!,
                        curve: Interval(
                          (1 / count) * index,
                          1.0,
                          curve: Curves.fastOutSlowIn,
                        ),
                      ),
                    );

                    animationController?.forward();
                    MealLogDto? mealLogDto;
                    switch (index) {
                      case 0:
                        mealLogDto = vm.listMealLog.firstWhere(
                          (element) => element.type == "Bữa sáng",
                          orElse: () =>
                              MealLogDto(totalKcal: 0, type: "Bữa sáng"),
                        );
                        break;
                      case 1:
                        mealLogDto = vm.listMealLog.firstWhere(
                          (element) => element.type == "Bữa trưa",
                          orElse: () =>
                              MealLogDto(totalKcal: 0, type: "Bữa trưa"),
                        );
                        break;
                      case 2:
                        mealLogDto = vm.listMealLog.firstWhere(
                          (element) => element.type == "Bữa tối",
                          orElse: () =>
                              MealLogDto(totalKcal: 0, type: "Bữa tối"),
                        );
                        break;
                      case 3:
                        mealLogDto = vm.listMealLog.firstWhere(
                          (element) => element.type == "Ăn vặt",
                          orElse: () =>
                              MealLogDto(totalKcal: 0, type: "Ăn vặt"),
                        );
                        break;
                    }
                    return MealsView(
                      mealsListData: mealsListData[index],
                      mealLogDto: mealLogDto,
                      animation: animation,
                      animationController: animationController!,
                    );
                  },
                ),
              ),
            ),
          );
        },
      );
    });
  }
}

class MealsView extends StatefulWidget {
  const MealsView(
      {super.key,
      this.mealsListData,
      this.mealLogDto,
      this.animationController,
      this.animation});

  final MealsListData? mealsListData;
  final MealLogDto? mealLogDto;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  State<MealsView> createState() => _MealsViewState();
}

class _MealsViewState extends State<MealsView> with TickerProviderStateMixin {
  AnimationController? animationController;
  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 601), vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.mealLogDto!.totalKcal != 0) {
          Get.toNamed(
            MyRouter.mealDetail,
            arguments: widget.mealLogDto,
          );
        }
      },
      child: AnimatedBuilder(
        animation: widget.animationController!,
        builder: (BuildContext context, Widget? child) {
          return FadeTransition(
            opacity: widget.animation!,
            child: Transform(
              transform: Matrix4.translationValues(
                  100 * (1.0 - widget.animation!.value), 0.0, 0.0),
              child: SizedBox(
                width: 130,
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 32, left: 8, right: 8, bottom: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: HexColor(widget.mealsListData!.endColor)
                                    .withOpacity(0.6),
                                offset: const Offset(1.1, 4.0),
                                blurRadius: 8.0),
                          ],
                          gradient: LinearGradient(
                            colors: <HexColor>[
                              HexColor(widget.mealsListData!.startColor),
                              HexColor(widget.mealsListData!.endColor),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(8.0),
                            bottomLeft: Radius.circular(8.0),
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(54.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 54, left: 16, right: 16, bottom: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.mealsListData!.titleTxt,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: FitnessAppTheme.fontName,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  letterSpacing: 0.2,
                                  color: FitnessAppTheme.white,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        widget.mealLogDto!.foodItemsDto != null
                                            ? widget.mealLogDto!.foodItemsDto!
                                                .map((e) => e.name)
                                                .toList()
                                                .join('\n')
                                            : '',
                                        style: const TextStyle(
                                          fontFamily: FitnessAppTheme.fontName,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10,
                                          letterSpacing: 0.2,
                                          color: FitnessAppTheme.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              widget.mealLogDto!.totalKcal != 0
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Text(
                                          widget.mealLogDto!.totalKcal
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontFamily:
                                                FitnessAppTheme.fontName,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                            letterSpacing: 0.2,
                                            color: FitnessAppTheme.white,
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 4, bottom: 6),
                                          child: Text(
                                            'kcal',
                                            style: TextStyle(
                                              fontFamily:
                                                  FitnessAppTheme.fontName,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10,
                                              letterSpacing: 0.2,
                                              color: FitnessAppTheme.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : InkWell(
                                      onTap: () {
                                        Get.toNamed(
                                          MyRouter.mealList,
                                          arguments: animationController,
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FitnessAppTheme.nearlyWhite,
                                          shape: BoxShape.circle,
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                                color: FitnessAppTheme
                                                    .nearlyBlack
                                                    .withOpacity(0.4),
                                                offset: const Offset(8.0, 8.0),
                                                blurRadius: 8.0),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Icon(
                                            Icons.add,
                                            color: HexColor(
                                                widget.mealsListData!.endColor),
                                            size: 24,
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        width: 84,
                        height: 84,
                        decoration: BoxDecoration(
                          color: FitnessAppTheme.nearlyWhite.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 8,
                      child: SizedBox(
                        width: 80,
                        height: 80,
                        child: Image.asset(widget.mealsListData!.imagePath),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
