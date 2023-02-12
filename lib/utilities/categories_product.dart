import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Categories extends StatelessWidget {
  Categories({Key? key}) : super(key: key);

  final List<Map> myProducts = List.generate(
      5, (index) => {"id": index, "name": "Category ${index + 1}"});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 14.h,
      width: 92.w,

      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: myProducts.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 150,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
        ),
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.all(2.sp),
            child: Container(

              decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(15)),

              child: Column(
                children: [
                   Container(
                   height: 10.4.h,
                     width: 20.w,
                     decoration: BoxDecoration(
                       image:DecorationImage(
                         image: NetworkImage("https://previews.123rf.com/images/ionutparvu/ionutparvu1612/ionutparvu161200410/67602131-categories-stamp-sign-text-word-logo-red-.jpg",),
                         fit: BoxFit.fill
                       )
                     ),
                   ),


                  Text(
                    myProducts[index]["name"],
                    style:TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
          );
        },

      ),
    );
  }
}
