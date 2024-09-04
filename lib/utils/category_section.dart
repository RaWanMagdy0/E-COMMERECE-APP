import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../domain/entities/CategoryEntity.dart';
import 'category_item.dart';

class CategorySection extends StatelessWidget {
  List<CategoryOrBrandEntity> categoryList;

  CategorySection({required this.categoryList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      child: GridView.builder(
        itemCount: categoryList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryItem(
            categoryEntity: categoryList[index],
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
      ),
    );
  }
}
