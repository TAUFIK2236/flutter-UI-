import 'package:design/utilities/carousel_slider.dart';
import 'package:design/utilities/categories_product.dart';
import 'package:design/utilities/sub_utilities/product_card.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class All_product extends StatefulWidget {
  const All_product({Key? key}) : super(key: key);

  @override
  State<All_product> createState() => _All_productState();
}

class _All_productState extends State<All_product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            ComplicatedImageDemo(),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.only(right: 61.w),
              child: Text(
                "Categories",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                  //  color: Colors.brown,
                ),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Categories(),
            SizedBox(
              height: 0.5.h,
            ),
            Categories(),
            SizedBox(
              height: 2.5.h,
            ),
            Padding(
                padding: EdgeInsets.only(right: 67.w),
                child: Text(
                  "Gift Card",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                    //  color: Colors.brown,
                  ),
                )),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ProductCard(),
                  ProductCard(),
                  ProductCard(),
                  ProductCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
