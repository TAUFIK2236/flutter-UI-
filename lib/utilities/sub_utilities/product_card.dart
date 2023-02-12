import 'package:flutter/material.dart';
import 'package:design/Pages/details_page.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';


class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String Name = "UNName";
   String url =  "https://previews.123rf.com/images/ionutparvu/ionutparvu1612/ionutparvu161200915/67602462-business-stamp-sign-text-word-logo-blue-.jpg";
    return Padding(
      padding: EdgeInsets.all(8.0.sp),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder:(context)=>detailsPage(pic:url, name:Name)));
        },
        child: Container(
          height: 26.h,
          width: 31.w,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 0.3.w,
            ),
            color: Color(0xffececec),
            borderRadius: BorderRadius.all(
              Radius.circular(10.sp),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(1.7.w, 1.h, 0.w, 0.5.h),
                child: Container(
                  decoration: BoxDecoration(
                    image:  DecorationImage(
                        image: NetworkImage(
                         url,
                        ),
                        fit: BoxFit.fill),
                    border: Border.all(
                      color: Colors.white,
                      width: 0.3.w,
                    ),
                    color: Color(0xff11ad22),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.sp),
                    ),
                  ),
                  height: 15.h,
                  width: 27.w,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "UNName",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w900,
                      ),
                    ),

                    Text(
                      "Price :",
                      style: TextStyle(
                        fontSize: 9.sp,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemSize: 15.sp,
                      itemCount: 5,
                      //  itemPadding: EdgeInsets.symmetric(horizontal:1.w),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
