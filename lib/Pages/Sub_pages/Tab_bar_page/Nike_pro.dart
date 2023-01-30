import 'package:design/Pages/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';

class NikePro extends StatefulWidget {
  const NikePro({Key? key}) : super(key: key);

  @override
  State<NikePro> createState() => _NkeProState();
}

class _NkeProState extends State<NikePro> {

  final List<Map> myProduct = List.generate(
      5, (index) => {"id": index, "name": "Name  ${index + 1}"});


    String url= 'https://seeklogo.com/images/N/nike-just-do-it-logo-0E50A046C1-seeklogo.com.png';
    String url1 = "https://previews.123rf.com/images/ionutparvu/ionutparvu1612/ionutparvu161200915/67602462-business-stamp-sign-text-word-logo-blue-.jpg";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
       // color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 5.h),
            Container(
              height: 30.h,
              width: 90.w,
              decoration:  BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        url
                    ),
                    fit: BoxFit.contain),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.w, 4.h, 67.0.w, 0.0),
              child: Text(
                "Products",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                  //  color: Colors.brown,
                ),
              ),
            ),
            GridView.builder(
              physics:NeverScrollableScrollPhysics(),
              itemCount: myProduct.length,
              shrinkWrap: true,

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 37.h,
                crossAxisSpacing: .1.w,
                mainAxisSpacing:.1.h,

              ),
              itemBuilder: (_, index) {
                return InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder:(context)=>detailsPage(pic:url1, name: myProduct[index]["name"],)));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0.sp),
                    child: Container(
                      height: 26.h,
                      width: 31.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.3.w,
                        ),
                        color: const Color(0xffececec),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.sp),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(1.7.w, 5, 0, 0.5.h),
                            child: Container(
                              decoration: BoxDecoration(
                                image:  DecorationImage(
                                    image: NetworkImage(
                                      url1
                                    ),
                                    fit: BoxFit.fill),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 0.3.w,
                                ),
                                color: const Color(0xff11ad22),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.sp),
                                ),
                              ),
                              height: 23.h,
                              width: 40.5.w,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  myProduct[index]["name"],
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
                                  itemBuilder: (context, _) => const Icon(
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
              },
            )
          ],
        ),
      ),
    );
  }
}
