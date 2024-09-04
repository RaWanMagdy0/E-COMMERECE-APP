import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/custom_bottom_navigation_bar.dart';
import 'cubit/home_screen_states.dart';
import 'cubit/home_screen_view_model.dart';

class HomeScreenView extends StatelessWidget {
  static const String routeName = 'homeScreen';

  HomeScreenViewModel viewModel = HomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenViewModel, HomeScreenStates>(
      bloc: viewModel,
      listener: (context, states) {},
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: CustomBottomNavigatioBar(
              selectedIndex: viewModel.selectedIndex,
              context: context,
              onTabFunction: (index) {
                viewModel.changeBottomNavigationBar(index);
              }),
          body: viewModel.tabs[viewModel.selectedIndex],
        );
      },
    );
  }
}
