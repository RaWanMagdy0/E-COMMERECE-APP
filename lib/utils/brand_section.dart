import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../domain/entities/CategoryEntity.dart';
import 'category_item.dart';

class BrandsSection extends StatelessWidget {
  List<CategoryOrBrandEntity> brandList;

  BrandsSection({required this.brandList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      child: GridView.builder(
        itemCount: brandList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryItem(
            categoryEntity: brandList[index],
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
