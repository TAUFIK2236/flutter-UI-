import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://static.vecteezy.com/system/resources/previews/008/195/327/non_2x/2023-happy-new-year-elegant-design-illustration-of-golden-2023-logo-numbers-on-black-background-perfect-typography-for-2023-save-the-date-luxury-designs-and-new-year-celebration-vector.jpg',
  //'https://my4kwallpapers.com/wp-content/uploads/2022/02/Adidas-Background.jpg',
  'https://images.complex.com/complex/images/c_fill,dpr_auto,f_auto,q_auto,w_1400/fl_lossy,pg_1/gtdsomrfke5tckpj1jtr/nike-logos-lead?fimg-ssr',
  'https://ufpro.com/storage/app/media/Landing%20pages/About%20Us/About-us-hero.jpg',
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          width: 1000.w,
          height: 1000.h,
          decoration: BoxDecoration(
            color:Colors.cyan,
            border: Border.all(
              color: Colors.brown,
              width:2.w,
            ),
            borderRadius: BorderRadius.circular(5.sp),
          ),
          child: Image.network(item, fit: BoxFit.fill),
        ))
    .toList();

class ComplicatedImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
       aspectRatio: 2.sp,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        autoPlay: true,
      ),
      items: imageSliders,
    );
  }
}
