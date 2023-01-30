import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class detailsPage extends StatefulWidget {
  const detailsPage({Key? key, required this.pic, required this.name})
      : super(key: key);

  final String pic;
  final String name;

  @override
  State<detailsPage> createState() => _detailsPageState();
}

class _detailsPageState extends State<detailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: ()=>Navigator.pop(context),
                  icon: Icon(Icons.arrow_back),
                ),
                SizedBox(width: 65.w),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add_shopping_cart_sharp),
                ),
              ],
            ),
            SizedBox(height: 1.h),
            Padding(
              padding: EdgeInsets.only(left: 7.1.w),
              child: Stack(
                children: [
                  Positioned(
                    //top: .h,
                    child: Container(
                      height: 42.h,
                      width: 85.w,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(-0.5.w, -0.5.h),
                              blurRadius: 5.0.sp),
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.5.w, .5.h),
                              blurRadius: 5.0.sp),
                        ],
                        image: DecorationImage(
                            image: NetworkImage(
                              widget.pic,
                            ),
                            fit: BoxFit.fill),
                        color: const Color(0xffececec),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.sp),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding:  EdgeInsets.only(left:7.1.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "Name:",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black54,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              SizedBox(
                height: 2.h,),
                  Text(
                    "Price:",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black54,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    "[Not yet determined]",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
