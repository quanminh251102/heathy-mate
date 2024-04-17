import 'package:healthy_mate/view_models/implements/auth_viewmodel.dart';
import 'package:healthy_mate/view_models/implements/food_viewmodel.dart';
import 'package:healthy_mate/view_models/interfaces/iauth_viewmodel.dart';
import 'package:healthy_mate/view_models/interfaces/ifood_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider12/single_child_widget.dart';

List<SingleChildWidget> viewModelProviders = [
  ChangeNotifierProvider<IAuthViewModel>(
    create: (_) => AuthViewModel(),
  ),
  ChangeNotifierProvider<IFoodViewModel>(
    create: (_) => FoodViewModel(),
  ),
];
