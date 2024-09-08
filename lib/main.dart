import 'package:e_comerence_app/splash_screen.dart';
import 'package:e_comerence_app/ui/auth/login/login_screen.dart';
import 'package:e_comerence_app/ui/auth/register/register_screen.dart';
import 'package:e_comerence_app/ui/home/cart/cart_screen.dart';
import 'package:e_comerence_app/ui/home/category_type/category_type_screen.dart';
import 'package:e_comerence_app/ui/home/home_screen/home_screen_view.dart';
import 'package:e_comerence_app/ui/tabs/wish_list_tab/wish_list_screen.dart';
import 'package:e_comerence_app/utils/my_bloc_observer.dart';
import 'package:e_comerence_app/utils/productDetailsView.dart';
import 'package:e_comerence_app/utils/shared_preference_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceUtils.init();
  Bloc.observer = MyBlocObserver();
  String route;
  var user = SharedPreferenceUtils.getData("Token");
  if (user == null) {
    route = LoginScreen.routName;
  } else {
    route = HomeScreenView.routeName;
  }
  runApp(MyApp(route));
}

class MyApp extends StatelessWidget {
  String route;

  MyApp(this.route);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: route,
            routes: {
              RegisterScreen.routName: (context) => RegisterScreen(),
              SplashScreen.routName: (context) => SplashScreen(),
              LoginScreen.routName: (context) => LoginScreen(),
              HomeScreenView.routeName: (context) => HomeScreenView(),
              ProductDetailsView.routName: (context) => ProductDetailsView(),
              CartScreen.routeName: (context) => CartScreen(),
              WishListScreen.routeName: (context) => WishListScreen(),
              CategoriesTypeScreen.routeName: (context) => CategoriesTypeScreen(),
            },
          );
        });
  }
}
