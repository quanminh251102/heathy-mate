// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:healthy_mate/dtos/meal_log_dto.dart';
import 'package:healthy_mate/fitness_app/fitness_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TrainingPlan extends StatelessWidget {
  final MealLogDto mealLogDto;
  final AnimationController? animationController;
  final Animation<double>? animation;
  const TrainingPlan({
    super.key,
    required this.mealLogDto,
    this.animationController,
    this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController!,
        builder: (BuildContext context, Widget? child) {
          return FadeTransition(
            opacity: animation!,
            child: Transform(
              transform: Matrix4.translationValues(
                  0.0, 30 * (1.0 - animation!.value), 0.0),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 16, bottom: 18),
                child: Container(
                  decoration: BoxDecoration(
                    color: FitnessAppTheme.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                        topRight: Radius.circular(8.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: FitnessAppTheme.grey.withOpacity(0.2),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 35.0,
                                  lineWidth: 6.0,
                                  percent: (mealLogDto.totalKcal! * 34) /
                                              (344 * 100) <
                                          1
                                      ? (mealLogDto.totalKcal! * 34) /
                                          (344 * 100)
                                      : 1,
                                  center: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        ((mealLogDto.totalKcal! * 34) / (344))
                                            .toStringAsFixed(
                                          0,
                                        ),
                                        style: const TextStyle(
                                          fontFamily: FitnessAppTheme.fontName,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: FitnessAppTheme.nearlyDarkBlue,
                                        ),
                                      ),
                                      const Text(
                                        'phút',
                                        style: TextStyle(
                                          fontFamily: FitnessAppTheme.fontName,
                                          fontSize: 12,
                                          color: FitnessAppTheme.nearlyDarkBlue,
                                        ),
                                      )
                                    ],
                                  ),
                                  progressColor: Colors.red,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Bơi lội',
                                  style: TextStyle(
                                    fontFamily: FitnessAppTheme.fontName,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: FitnessAppTheme.nearlyDarkBlue,
                                  ),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                            ),
                            Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 35.0,
                                  lineWidth: 6.0,
                                  percent: (mealLogDto.totalKcal! * 103) /
                                              (344 * 100) <
                                          1
                                      ? (mealLogDto.totalKcal! * 103) /
                                          (344 * 100)
                                      : 1,
                                  center: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        ((mealLogDto.totalKcal! * 103) / (344))
                                            .toStringAsFixed(
                                          0,
                                        ),
                                        style: const TextStyle(
                                          fontFamily: FitnessAppTheme.fontName,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: FitnessAppTheme.nearlyDarkBlue,
                                        ),
                                      ),
                                      const Text(
                                        'phút',
                                        style: TextStyle(
                                          fontFamily: FitnessAppTheme.fontName,
                                          fontSize: 12,
                                          color: FitnessAppTheme.nearlyDarkBlue,
                                        ),
                                      )
                                    ],
                                  ),
                                  progressColor: Colors.orange,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Đi bộ',
                                  style: TextStyle(
                                    fontFamily: FitnessAppTheme.fontName,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: FitnessAppTheme.nearlyDarkBlue,
                                  ),
                                )
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                            ),
                            Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 35.0,
                                  lineWidth: 6.0,
                                  percent: (mealLogDto.totalKcal! * 52) /
                                              (344 * 100) <
                                          1
                                      ? (mealLogDto.totalKcal! * 52) /
                                          (344 * 100)
                                      : 1,
                                  center: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        ((mealLogDto.totalKcal! * 52) / (344))
                                            .toStringAsFixed(
                                          0,
                                        ),
                                        style: const TextStyle(
                                          fontFamily: FitnessAppTheme.fontName,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: FitnessAppTheme.nearlyDarkBlue,
                                        ),
                                      ),
                                      const Text(
                                        'phút',
                                        style: TextStyle(
                                          fontFamily: FitnessAppTheme.fontName,
                                          fontSize: 12,
                                          color: FitnessAppTheme.nearlyDarkBlue,
                                        ),
                                      )
                                    ],
                                  ),
                                  progressColor: Colors.yellow,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Đạp xe',
                                  style: TextStyle(
                                    fontFamily: FitnessAppTheme.fontName,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: FitnessAppTheme.nearlyDarkBlue,
                                  ),
                                )
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                            ),
                            Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 35.0,
                                  lineWidth: 6.0,
                                  percent: (mealLogDto.totalKcal! * 69) /
                                              (344 * 100) <
                                          1
                                      ? (mealLogDto.totalKcal! * 69) /
                                          (344 * 100)
                                      : 1,
                                  center: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        ((mealLogDto.totalKcal! * 69) / (344))
                                            .toStringAsFixed(
                                          0,
                                        ),
                                        style: const TextStyle(
                                          fontFamily: FitnessAppTheme.fontName,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: FitnessAppTheme.nearlyDarkBlue,
                                        ),
                                      ),
                                      const Text(
                                        'phút',
                                        style: TextStyle(
                                          fontFamily: FitnessAppTheme.fontName,
                                          fontSize: 12,
                                          color: FitnessAppTheme.nearlyDarkBlue,
                                        ),
                                      )
                                    ],
                                  ),
                                  progressColor: Colors.green,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Chạy bộ',
                                  style: TextStyle(
                                    fontFamily: FitnessAppTheme.fontName,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: FitnessAppTheme.nearlyDarkBlue,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                ),
              ),
            ),
          );
        });
  }
}
