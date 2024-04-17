// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:healthy_mate/dtos/food_item_dto.dart';
import 'package:healthy_mate/dtos/meal_log_dto.dart';
import 'package:healthy_mate/fitness_app/fitness_app_theme.dart';
import 'package:healthy_mate/global/router.dart';
import 'package:healthy_mate/view_models/interfaces/ifood_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class FoodListView extends StatefulWidget {
  final MealLogDto mealLogDto;
  final AnimationController? animationController;
  final Animation<double>? animation;

  const FoodListView({
    super.key,
    required this.mealLogDto,
    this.animationController,
    this.animation,
  });

  @override
  _FoodListViewState createState() => _FoodListViewState();
}

class _FoodListViewState extends State<FoodListView>
    with TickerProviderStateMixin {
  final ScrollController scrollController = ScrollController();
  AnimationController? listAnimationController;
  @override
  void initState() {
    listAnimationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);

    widget.animationController!.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<IFoodViewModel>(
        builder: (context, vm, child) {
          return AnimatedBuilder(
              animation: widget.animationController!,
              builder: (BuildContext context, Widget? child) {
                return FadeTransition(
                  opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: widget.animationController!,
                      curve: const Interval(
                        (1 / 9) * 3,
                        1.0,
                        curve: Curves.fastOutSlowIn,
                      ),
                    ),
                  ),
                  child: Transform(
                    transform: Matrix4.translationValues(
                        0.0,
                        30 *
                            (1.0 -
                                Tween<double>(begin: 0.0, end: 1.0)
                                    .animate(
                                      CurvedAnimation(
                                        parent: widget.animationController!,
                                        curve: const Interval(
                                          (1 / 9) * 3,
                                          1.0,
                                          curve: Curves.fastOutSlowIn,
                                        ),
                                      ),
                                    )
                                    .value),
                        0.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      controller: scrollController,
                      padding: EdgeInsets.only(
                        bottom: 62 + MediaQuery.of(context).padding.bottom,
                      ),
                      itemCount: widget.mealLogDto.foodItemsDto!.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        final int count =
                            widget.mealLogDto.foodItemsDto!.length > 10
                                ? 10
                                : widget.mealLogDto.foodItemsDto!.length;
                        final Animation<double> animation =
                            Tween<double>(begin: 0.0, end: 1.0).animate(
                                CurvedAnimation(
                                    parent: listAnimationController!,
                                    curve: Interval((1 / count) * index, 1.0,
                                        curve: Curves.fastOutSlowIn)));
                        listAnimationController?.forward();
                        return MealFoodCard(
                          mealsListData: widget.mealLogDto.foodItemsDto![index],
                          animation: animation,
                          animationController: listAnimationController!,
                        );
                      },
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}

class MealFoodCard extends StatelessWidget {
  final FoodItemDto? mealsListData;
  final AnimationController? animationController;
  final Animation<double>? animation;
  const MealFoodCard({
    super.key,
    required this.mealsListData,
    required this.animationController,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    IFoodViewModel iFoodViewModel = context.read<IFoodViewModel>();
    return InkWell(
      onTap: () {
        Get.toNamed(MyRouter.foodDetail, arguments: mealsListData);
      },
      child: AnimatedBuilder(
          animation: animationController!,
          builder: (BuildContext context, Widget? child) {
            return FadeTransition(
              opacity: animation!,
              child: Transform(
                transform: Matrix4.translationValues(
                    100 * (1.0 - animation!.value), 0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  child: Card(
                    color: Colors.white,
                    shadowColor: FitnessAppTheme.nearlyDarkBlue,
                    child: Container(
                      width: double.infinity,
                      height: 110,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  mealsListData!.name.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: FitnessAppTheme.nearlyDarkBlue,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    '${mealsListData!.portion!.portionName} - ${mealsListData!.portion!.portionSize!}g',
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
                            Row(
                              children: [
                                Text(
                                  '${((mealsListData!.nutritionalInfo!.kcal!) * (animation!.value)).toStringAsFixed(2)}'
                                  ' Kcal',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: FitnessAppTheme.nearlyDarkBlue,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
