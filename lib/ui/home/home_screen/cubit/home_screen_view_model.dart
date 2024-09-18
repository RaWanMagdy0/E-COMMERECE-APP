import 'package:bloc/bloc.dart';
import 'package:e_comerence_app/ui/tabs/product_tab/product_list_tab.dart';
import 'package:flutter/cupertino.dart';

import '../../../tabs/home_tab/home_tab.dart';
import '../../../tabs/profile_tab/cubit/profile.dart';
import '../../../tabs/profile_tab/profile_screen.dart';
import '../../../tabs/wish_list_tab/wish_list_screen.dart';
import 'home_screen_states.dart';

class HomeScreenViewModel extends Cubit<HomeScreenStates> {
  HomeScreenViewModel() : super(HomeScreenInitialStates());
  int selectedIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    ProductListTab(),
    WishListScreen(),
    ProfileScreeen(),
  ];

  void changeBottomNavigationBar(int newSelectedIndex) {
    HomeScreenInitialStates();
    selectedIndex = newSelectedIndex;
    emit(ChangeBottomNavigatioBar());
  }
}
