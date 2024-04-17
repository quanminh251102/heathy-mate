// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math' as math;

import 'package:healthy_mate/dtos/meal_log_dto.dart';
import 'package:healthy_mate/fitness_app/fitness_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class NutritionChart extends StatefulWidget {
  final MealLogDto mealLogDto;
  final AnimationController? animationController;
  final Animation<double>? animation;
  const NutritionChart({
    super.key,
    required this.mealLogDto,
    this.animationController,
    this.animation,
  });

  @override
  NutritionChartState createState() => NutritionChartState();
}

class NutritionChartState extends State<NutritionChart> {
  Map<String, double> createNutrientMap(MealLogDto mealLog) {
    double totalFat = 0.0;
    double totalProtein = 0.0;
    double totalCarbs = 0.0;

    mealLog.foodItemsDto?.forEach((foodItem) {
      if (foodItem.nutritionalInfo != null) {
        totalFat += foodItem.nutritionalInfo?.fat ?? 0.0;
        totalProtein += foodItem.nutritionalInfo?.protein ?? 0.0;
        totalCarbs += foodItem.nutritionalInfo?.carbs ?? 0.0;
      }
    });
    return {
      'fat': totalFat,
      'protein': totalProtein,
      'carbs': totalCarbs,
    };
  }

  Map<String, double>? dataMap;
  Map<String, String>? legendLabels;
  Map<String, String> createLegendLabel(MealLogDto mealLog) {
    double totalFat = 0.0;
    double totalProtein = 0.0;
    double totalCarbs = 0.0;

    mealLog.foodItemsDto?.forEach((foodItem) {
      if (foodItem.nutritionalInfo != null) {
        totalFat += foodItem.nutritionalInfo?.fat ?? 0.0;
        totalProtein += foodItem.nutritionalInfo?.protein ?? 0.0;
        totalCarbs += foodItem.nutritionalInfo?.carbs ?? 0.0;
      }
    });
    return {
      'fat': "Chất béo tổng hợp: " + totalFat.toStringAsFixed(2) + 'g',
      'protein': "Chất đạm: " + totalProtein.toStringAsFixed(2) + 'g',
      'carbs': "Tinh bột: " + totalCarbs.toStringAsFixed(2) + 'g',
    };
  }

  final colorList = <Color>[
    const Color(0xfffdcb6e),
    const Color(0xff0984e3),
    const Color(0xfffd79a8),
    const Color(0xffe17055),
    const Color(0xff6c5ce7),
  ];

  final ChartType _chartType = ChartType.ring;
  final bool _showCenterWidget = true;
  final double _ringStrokeWidth = 32;
  final double _chartLegendSpacing = 32;
  final bool _showLegends = true;
  final bool _showChartValues = true;

  int key = 0;
  @override
  void initState() {
    dataMap = createNutrientMap(widget.mealLogDto);
    legendLabels = createLegendLabel(widget.mealLogDto);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final chart = PieChart(
      key: ValueKey(key),
      dataMap: dataMap!,
      animationDuration: const Duration(milliseconds: 800),
      chartLegendSpacing: _chartLegendSpacing,
      chartRadius: math.min(MediaQuery.of(context).size.width / 3.2, 300),
      colorList: colorList,
      initialAngleInDegree: 0,
      chartType: _chartType,
      centerWidget: _showCenterWidget
          ? Container(
              child: Text(
                '${widget.mealLogDto.totalKcal!.toInt()} Kcal',
                style: const TextStyle(
                  fontFamily: FitnessAppTheme.fontName,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: FitnessAppTheme.nearlyDarkBlue,
                ),
              ),
            )
          : null,
      legendLabels: legendLabels!,
      legendOptions: LegendOptions(
        legendPosition: LegendPosition.bottom,
        showLegends: _showLegends,
        legendShape: BoxShape.circle,
        legendTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
          showChartValues: _showChartValues,
          showChartValuesInPercentage: true,
          showChartValuesOutside: true,
          showChartValueBackground: false),
      ringStrokeWidth: _ringStrokeWidth,
      emptyColor: Colors.grey,
      emptyColorGradient: const [
        Color(0xff6c5ce7),
        Colors.blue,
      ],
      baseChartColor: Colors.transparent,
    );

    return AnimatedBuilder(
        animation: widget.animationController!,
        builder: (BuildContext context, Widget? child) {
          return FadeTransition(
            opacity: widget.animation!,
            child: Transform(
              transform: Matrix4.translationValues(
                  0.0, 30 * (1.0 - widget.animation!.value), 0.0),
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
                  child: LayoutBuilder(
                    builder: (_, constraints) {
                      if (constraints.maxWidth >= 600) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              flex: 3,
                              fit: FlexFit.tight,
                              child: chart,
                            ),
                          ],
                        );
                      } else {
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 32,
                                ),
                                child: chart,
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          );
        });
  }
}
