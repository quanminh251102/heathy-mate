// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:healthy_mate/db/db_helper.dart';
import 'package:healthy_mate/dtos/food_item_dto.dart';
import 'package:healthy_mate/fitness_app/fitness_app_theme.dart';
import 'package:healthy_mate/global/router.dart';
import 'package:healthy_mate/view_models/interfaces/ifood_viewmodel.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class MealListScreen extends StatefulWidget {
  const MealListScreen({super.key, this.animationController});
  final AnimationController? animationController;
  @override
  _MealListScreenState createState() => _MealListScreenState();
}

class _MealListScreenState extends State<MealListScreen>
    with TickerProviderStateMixin {
  late IFoodViewModel _iFoodViewModel;
  Animation<double>? topBarAnimation;
  AnimationController? listAnimationController;
  List<FoodItemDto> listFood = [];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;
  int selectedType = 0;
  TextEditingController searchController = TextEditingController();
  final List<String> items = [
    "Bữa sáng",
    "Bữa trưa",
    "Bữa tối",
    "Ăn vặt",
  ];
  String? selectedValue;

  @override
  void initState() {
    _iFoodViewModel = context.read<IFoodViewModel>();
    listAnimationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: widget.animationController!,
        curve: const Interval(
          0,
          0.5,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

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
    widget.animationController!.forward();
    Future.delayed(
      Duration.zero,
      () async {
        await _iFoodViewModel.loadFoodItems();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: FitnessAppTheme.background,
        body: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: AppBar().preferredSize.height +
                        MediaQuery.of(context).padding.top +
                        24,
                    left: 24,
                    right: 24,
                    bottom: 10,
                  ),
                  child: CupertinoSearchTextField(
                    controller: searchController,
                    onSubmitted: (value) async {
                      value = value.trim().toLowerCase();
                      await _iFoodViewModel.searchFoodItems(value);
                    },
                  ),
                ),
                Expanded(child: Consumer<IFoodViewModel>(
                  builder: (context, vm, child) {
                    return AnimatedBuilder(
                        animation: widget.animationController!,
                        builder: (BuildContext context, Widget? child) {
                          return FadeTransition(
                            opacity:
                                Tween<double>(begin: 0.0, end: 1.0).animate(
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
                                                  parent: widget
                                                      .animationController!,
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
                                controller: scrollController,
                                padding: EdgeInsets.only(
                                  bottom: 62 +
                                      MediaQuery.of(context).padding.bottom,
                                ),
                                itemCount: vm.listFood.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int index) {
                                  final int count = vm.listFood.length > 10
                                      ? 10
                                      : vm.listFood.length;
                                  final Animation<double> animation =
                                      Tween<double>(begin: 0.0, end: 1.0)
                                          .animate(CurvedAnimation(
                                              parent: listAnimationController!,
                                              curve: Interval(
                                                  (1 / count) * index, 1.0,
                                                  curve:
                                                      Curves.fastOutSlowIn)));
                                  listAnimationController?.forward();
                                  return MealCard(
                                    addFood: () async {
                                      if (selectedValue != null) {
                                        DbHelper.instance
                                            .addFoodItemToMealByType(
                                                _iFoodViewModel
                                                        .currentMealType ??
                                                    '0',
                                                vm.listFood[index])
                                            .then(
                                          (value) async {
                                            await _iFoodViewModel
                                                .fetchFoodLog();
                                          },
                                        );
                                      } else {
                                        EasyLoading.showError(
                                            'Vui lòng chọn bữa ăn!');
                                      }
                                    },
                                    mealsListData: vm.listFood[index],
                                    animation: animation,
                                    animationController:
                                        listAnimationController!,
                                  );
                                },
                              ),
                            ),
                          );
                        });
                  },
                )),
              ],
            ),
            Column(
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
                            color: FitnessAppTheme.white
                                .withOpacity(topBarOpacity),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        if (widget.animationController
                                                ?.duration ==
                                            const Duration(milliseconds: 601))
                                          InkWell(
                                              onTap: () => Get.back(),
                                              child: const Icon(
                                                  Icons.arrow_back_ios)),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Món ăn',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily:
                                                  FitnessAppTheme.fontName,
                                              fontWeight: FontWeight.w700,
                                              fontSize:
                                                  22 + 6 - 6 * topBarOpacity,
                                              letterSpacing: 1.2,
                                              color: FitnessAppTheme.darkerText,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    DropdownButtonHideUnderline(
                                      child: DropdownButton2<String>(
                                        isExpanded: true,
                                        hint: const Row(
                                          children: [
                                            Icon(
                                              Icons.list,
                                              size: 16,
                                              color: FitnessAppTheme
                                                  .nearlyDarkBlue,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Expanded(
                                              child: Text(
                                                'Chọn bữa ăn',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: FitnessAppTheme
                                                      .nearlyDarkBlue,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        items: items
                                            .map((String item) =>
                                                DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ))
                                            .toList(),
                                        value: selectedValue,
                                        onChanged: (String? value) {
                                          setState(() {
                                            selectedValue = value;
                                          });
                                          _iFoodViewModel.setCurrentMealType =
                                              selectedValue ?? '';
                                        },
                                        buttonStyleData: ButtonStyleData(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          height: 40,
                                          width:
                                              selectedValue != null ? 140 : 160,
                                        ),
                                        dropdownStyleData:
                                            const DropdownStyleData(
                                          maxHeight: 200,
                                        ),
                                        menuItemStyleData:
                                            const MenuItemStyleData(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                        ),
                                        iconStyleData: const IconStyleData(
                                          openMenuIcon:
                                              Icon(Icons.arrow_drop_up),
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
            )
          ],
        ));
  }
}

class MealCard extends StatelessWidget {
  final FoodItemDto? mealsListData;
  final AnimationController? animationController;
  final Animation<double>? animation;
  final Function() addFood;
  const MealCard({
    super.key,
    required this.mealsListData,
    required this.animationController,
    required this.animation,
    required this.addFood,
  });

  @override
  Widget build(BuildContext context) {
    IFoodViewModel iFoodViewModel = context.read<IFoodViewModel>();
    return InkWell(
      onTap: () => Get.toNamed(MyRouter.foodDetail, arguments: mealsListData),
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
                                  '${((mealsListData!.nutritionalInfo!.kcal!) * (animation!.value)).toStringAsFixed(2)} Kcal',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: FitnessAppTheme.nearlyDarkBlue,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () async {
                                    await addFood().then(
                                      (value) async {
                                        await iFoodViewModel.fetchFoodLog();
                                      },
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FitnessAppTheme.nearlyWhite,
                                      shape: BoxShape.circle,
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            color: FitnessAppTheme
                                                .nearlyDarkBlue
                                                .withOpacity(0.4),
                                            offset: const Offset(4.0, 4.0),
                                            blurRadius: 8.0),
                                      ],
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(6.0),
                                      child: Icon(
                                        Icons.add,
                                        color: FitnessAppTheme.nearlyDarkBlue,
                                        size: 24,
                                      ),
                                    ),
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
