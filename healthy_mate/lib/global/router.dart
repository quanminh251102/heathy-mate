import 'package:healthy_mate/dtos/food_item_dto.dart';
import 'package:healthy_mate/dtos/meal_log_dto.dart';
import 'package:healthy_mate/fitness_app/fitness_app_home_screen.dart';
import 'package:healthy_mate/fitness_app/my_diary/choose_date_screen.dart';
import 'package:healthy_mate/fitness_app/screen/food_detail/food_detail_screen.dart';
import 'package:healthy_mate/fitness_app/screen/goal_screen/goal_screen.dart';
import 'package:healthy_mate/fitness_app/screen/info_screen/info_screen.dart';
import 'package:healthy_mate/fitness_app/screen/meal/meal_list_screen.dart';
import 'package:healthy_mate/fitness_app/screen/meal_detail/meal_detail_screen.dart';
import 'package:healthy_mate/fitness_app/screen/onboarding/introduction_screen.dart';
import 'package:healthy_mate/fitness_app/screen/register_screen/register_screen.dart';
import 'package:healthy_mate/fitness_app/screen/splash_screen.dart';
import 'package:healthy_mate/fitness_app/screen/statistics/statistics_screen.dart';
import 'package:flutter/material.dart';

class MyRouter {
  static const String splash = 'splash';
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
  static const String home = '/home';
  static const String booking = '/booking';
  static const String addBooking = '/addBooking';
  static const String chatRoom = '/chatRoom';
  static const String message = '/message';
  static const String call = '/call';
  static const String incomingCall = '/incomingCall';
  static const String profile = '/profile';
  static const String updateProfile = '/updateProfile';
  static const String privacyPolicy = '/privacyPolicy';
  static const String createApply = '/createApply';
  static const String applyInBooking = '/applyInBooking';
  static const String myApply = '/myApply';
  static const String myBooking = '/myBooking';
  static const String myReview = '/myReview';
  static const String pickPlaceMap = '/pickPlaceMap';
  static const String confirmPlaceMap = '/confirmPlaceMap';
  static const String notification = '/notification';
  static const String driverProfile = '/driverProfile';
  static const String navigation = '/navigation';
  static const String bookingDetail = '/bookingDetail';
  static const String chatbotScreen = '/chatbotScreen';
  static const String onBoarding = '/onBoarding';
  static const String info = '/info';
  static const String goal = '/goal';
  static const String statistic = '/statistic';
  static const String chooseDate = '/chooseDate';
  static const String mealList = '/mealList';
  static const String mealDetail = '/mealDetail';
  static const String foodDetail = '/foodDetail';
  static const String registerScreen = '/registerScreen';
  static PageRouteBuilder _buildRouteNavigationWithoutEffect(
      RouteSettings settings, Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => widget,
      transitionDuration: Duration.zero,
      settings: settings,
    );
  }

  static PageRouteBuilder _buildRouteNavigation(
      RouteSettings settings, Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => widget,
      settings: settings,
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _buildRouteNavigation(
          settings,
          const SplashScreen(),
        );
      case onBoarding:
        return _buildRouteNavigation(
          settings,
          const OnBoardingScreen(),
        );
      case home:
        return _buildRouteNavigation(
          settings,
          const FitnessAppHomeScreen(),
        );
      case info:
        return _buildRouteNavigation(
          settings,
          const InfoScreen(),
        );
      case goal:
        return _buildRouteNavigation(
          settings,
          const GoalScreen(),
        );
      case statistic:
        return _buildRouteNavigation(
          settings,
          const StatisticsScreen(),
        );
      case chooseDate:
        return _buildRouteNavigation(
          settings,
          ChooseDateScreen(
            initialDate: settings.arguments as DateTime,
          ),
        );
      case mealList:
        return _buildRouteNavigation(
          settings,
          MealListScreen(
            animationController: settings.arguments as AnimationController,
          ),
        );
      case mealDetail:
        return _buildRouteNavigation(
          settings,
          MealDetailScreen(
            mealLogDto: settings.arguments as MealLogDto,
          ),
        );
      case foodDetail:
        return _buildRouteNavigation(
          settings,
          FoodDetailScreen(
            foodItemDto: settings.arguments as FoodItemDto,
          ),
        );
      case registerScreen:
        return _buildRouteNavigation(
          settings,
          const UpdateUserScreen(),
        );
      default:
        return _buildRouteNavigation(
          settings,
          Scaffold(
            body: Center(
              child: Text('No route found: ${settings.name}.'),
            ),
          ),
        );
    }
  }
}
