import 'package:healthy_mate/fitness_app/ui_view/body_measurement.dart';
import 'package:healthy_mate/fitness_app/ui_view/glass_view.dart';
import 'package:healthy_mate/fitness_app/ui_view/mediterranean_diet_view.dart';
import 'package:healthy_mate/fitness_app/ui_view/title_view.dart';
import 'package:healthy_mate/fitness_app/fitness_app_theme.dart';
import 'package:healthy_mate/fitness_app/my_diary/meals_list_view.dart';
import 'package:healthy_mate/fitness_app/my_diary/water_view.dart';
import 'package:healthy_mate/view_models/interfaces/ifood_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MyDiaryScreen extends StatefulWidget {
  const MyDiaryScreen({super.key, this.animationController});

  final AnimationController? animationController;
  @override
  _MyDiaryScreenState createState() => _MyDiaryScreenState();
}

class _MyDiaryScreenState extends State<MyDiaryScreen>
    with TickerProviderStateMixin {
  DateTime currentDate = DateTime.now();
  Animation<double>? topBarAnimation;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;
  late IFoodViewModel _iFoodViewModel;
  @override
  void initState() {
    _iFoodViewModel = context.read<IFoodViewModel>();
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController!,
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

    Future.delayed(
      Duration.zero,
      () async {
        await _iFoodViewModel.getFoodLogByDay(currentDate);
      },
    );

    widget.animationController!.forward();
    super.initState();
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
      child: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).padding.top * 2 + 20,
        ),
        TitleView(
          titleTxt: 'Nhật ký dinh dưỡng',
          subTxt: 'Details',
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: widget.animationController!,
                  curve:
                      const Interval((1 / 9) * 0, 1.0, curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController!,
        ),
        MediterranesnDietView(
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: widget.animationController!,
                  curve:
                      const Interval((1 / 9) * 1, 1.0, curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController!,
        ),
        TitleView(
          titleTxt: 'Bữa ăn hôm nay',
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: widget.animationController!,
                  curve:
                      const Interval((1 / 9) * 2, 1.0, curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController!,
        ),
        MealsListView(
          mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: widget.animationController!,
                  curve:
                      const Interval((1 / 9) * 3, 1.0, curve: Curves.fastOutSlowIn))),
          mainScreenAnimationController: widget.animationController,
        ),
        TitleView(
          titleTxt: 'Chỉ số cơ thể',
          subTxt: 'Today',
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: widget.animationController!,
                  curve:
                      const Interval((1 / 9) * 4, 1.0, curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController!,
        ),
        BodyMeasurementView(
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: widget.animationController!,
                  curve:
                      const Interval((1 / 9) * 5, 1.0, curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController!,
        ),
        TitleView(
          titleTxt: 'Water',
          subTxt: 'Aqua SmartBottle',
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: widget.animationController!,
                  curve:
                      const Interval((1 / 9) * 6, 1.0, curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController!,
        ),
        WaterView(
          mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: widget.animationController!,
                  curve:
                      const Interval((1 / 9) * 7, 1.0, curve: Curves.fastOutSlowIn))),
          mainScreenAnimationController: widget.animationController!,
        ),
        GlassView(
            animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                    parent: widget.animationController!,
                    curve: const Interval((1 / 9) * 8, 1.0,
                        curve: Curves.fastOutSlowIn))),
            animationController: widget.animationController!),
      ]),
    );
  }

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: widget.animationController!,
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Nhật ký của bạn',
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
                            ),
                            InkWell(
                              onTap: () {
                                showDatePicker(
                                    context: context,
                                    locale: const Locale("vi", "VN"),
                                    initialDate: currentDate,
                                    firstDate: DateTime(2018),
                                    lastDate: DateTime(2030),
                                    builder:
                                        (BuildContext context, Widget? child) {
                                      return Theme(
                                        data: ThemeData.dark(),
                                        child: child!,
                                      );
                                    }).then(
                                  (v) async {
                                    final DateFormat formatter =
                                        DateFormat('dd/MM/yyyy');
                                    if (v != null && currentDate != v) {
                                      setState(
                                        () {
                                          currentDate = v;
                                        },
                                      );
                                    } else {
                                      setState(
                                        () {
                                          currentDate = DateTime.now();
                                        },
                                      );
                                    }
                                    await _iFoodViewModel
                                        .getFoodLogByDay(currentDate);
                                  },
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 8,
                                  right: 8,
                                ),
                                child: Row(
                                  children: <Widget>[
                                    const Padding(
                                      padding: EdgeInsets.only(right: 8),
                                      child: Icon(
                                        Icons.calendar_today,
                                        color: FitnessAppTheme.grey,
                                        size: 18,
                                      ),
                                    ),
                                    Text(
                                      '${DateFormat('dd').format(currentDate)} Th${DateFormat('MM').format(currentDate)}',
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        fontFamily: FitnessAppTheme.fontName,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18,
                                        letterSpacing: -0.2,
                                        color: FitnessAppTheme.darkerText,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
