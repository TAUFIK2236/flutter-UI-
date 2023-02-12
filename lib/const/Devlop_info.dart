import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DevlopInfo extends StatelessWidget {
  const DevlopInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 2.w,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Back"),
                ),
                SizedBox(
                  width: 15.4.w,
                ),
                Text(
                  "App's Details",
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 39.w),
              child: Container(
                height: 13.1.h,
                width: 21.8.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/pic.jpg'),
                      fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(-0.3.w, -0.3.h),
                        blurRadius: 5.0.sp),
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.3.w, .3.h),
                        blurRadius: 4.0.sp),
                  ],
                  color: Color(0xff616b6b),
                  borderRadius: BorderRadius.all(
                    Radius.circular(100.sp),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "DemoUI By :",
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: .5.h,
                  ),
                  Text(
                    "Taofik",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.amberAccent,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Email :",
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.email,
                        color: Colors.amberAccent,
                        size: 20.sp,
                      ),
                      Text(
                        " taufikalislam@gmail.com",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.amberAccent,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Percentage of Skill :",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    " 10 %",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.amberAccent,
                    ),
                  ),

                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Description :",
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    textAlign: TextAlign.start,
                   """This is a clone and approximately functional app .
Tried to being clone of MONARCH MART.
Tried to use all  basic utilities as much as possible.
PROVIDER has been used here as Data State management. 
For persist and modify all product's List SharedPreferences has  been used.
As presence of List-widget,GridVIew and ListView are mentionable"""

                 ,


                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
