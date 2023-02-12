import 'package:design/Pages/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';

final List<String> AdidasProNameList = [
  "Adidas Shop",
  "Adidas logo",
  "Addias in capture",
  "Adidas corpo",
  "Adidas sign",
];

final List<String> AdidasImgList = [
  'https://assets.bwbx.io/images/users/iqjWHBFdfxIU/iGfQkiYlBOT8/v1/1200x-1.jpg',
  'https://play-lh.googleusercontent.com/iPzanFznFsaq0QPJ320jnt5MkFcs6katVZXW5JWTM7Mrdt9oOETeLVJBEf6Lpy52MIys=w240-h480-rw',
  'https://footwearnews.com/wp-content/uploads/2022/01/adidas-logo-worth.jpg?w=700&h=437&crop=1',
  'https://thinkmarketingmagazine.com/wp-content/uploads/2012/08/Adidas-logo-and-brand-transformations-story.jpeg',
  'https://imageio.forbes.com/specials-images/imageserve/608193027a31ed6c5d1c1409/Adidas-Store/960x0.jpg?format=jpg&width=960',
];

class Adidas extends StatefulWidget {
  const Adidas({Key? key}) : super(key: key);

  @override
  State<Adidas> createState() => _AdidasState();
}

class _AdidasState extends State<Adidas> {
  var url =
      'https://assets.bwbx.io/images/users/iqjWHBFdfxIU/iGfQkiYlBOT8/v1/1200x-1.jpg';

  var Tex = "Adidas Shop";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0.sp),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(15.sp),
                    border: Border.all(color: Colors.grey, width: 0.2.w),
                  ),
                  height: 50.h,
                  width: 94.w,
                  child: Padding(
                    padding: EdgeInsets.all(8.0.sp),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => detailsPage(
                                    pic: url,
                                    name: Tex,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: 47.h,
                              width: 53.w,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10.sp),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 2.sp,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 26.h,
                                    width: 53.w,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(url),
                                          fit: BoxFit.cover),
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
                                      border: Border.all(
                                        width: 2.sp,
                                        //  color: Colors.red,
                                        color: Colors.grey,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.2.h,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(1.h, 0, 0, 0.h),
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            Tex,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.sp,
                                            ),
                                          ),
                                          Text(
                                            "Price:",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10.sp,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Text(
                                            "Rating:",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10.sp,
                                            ),
                                          ),
                                          RatingBar.builder(
                                            initialRating: 4,
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
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Container(
                            width: 33.2.w,
                            height: 49.h,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: AdidasImgList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      url = AdidasImgList[index];
                                      Tex = AdidasProNameList[index];
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 1.4.h),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          width: 2.sp,
                                          color: Colors.brown,
                                          style: BorderStyle.solid,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                AdidasImgList[index]),
                                            fit: BoxFit.cover),
                                      ),
                                      height: 10.6.h,
                                      width: 33.5.w,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://www.pngarts.com/files/4/Adidas-Logo-Transparent-Image.png'),
                      fit: BoxFit.cover),
                ),
                // color: Colors.black,
                height: 45.h,
                width: 90.w,
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
