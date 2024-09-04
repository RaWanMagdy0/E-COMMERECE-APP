import 'package:e_comerence_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_color.dart';

class Drawer extends StatelessWidget {
  static const int categories = 1;
  static const int settings = 2;
  Function onDrwerItemClick;

  Drawer({required this.onDrwerItemClick});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: AppColors.primaryColor,
            child: Text(
              "Men's Fashion",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
