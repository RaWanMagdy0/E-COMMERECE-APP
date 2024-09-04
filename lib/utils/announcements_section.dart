import 'package:e_comerence_app/utils/my_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'my_color.dart';

class AnnouncementSection extends StatelessWidget {
  List<String> sliderImages = [
    MyAssets.Announcement1,
    MyAssets.Announcement2,
    MyAssets.Announcement3
  ];

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      initialPage: 0,
      indicatorColor: AppColors.primaryColor,
      indicatorBackgroundColor: AppColors.whiteColor,
      indicatorBottomPadding: 20.h,
      autoPlayInterval: 3000,
      isLoop: true,
      children: sliderImages
          .map((url) => Padding(
                padding: EdgeInsets.all(0.8),
                child: Image.asset(
                  url,
                  fit: BoxFit.fill,
                  width: 398.w,
                  height: 200.h,
                ),
              ))
          .toList(),
    );
  }
}
