import 'package:design/Pages/homePage.dart';
import 'package:design/const/AppColors.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sizer/sizer.dart';

import '../utilities/Drawr.dart';



class loadingScreen extends StatefulWidget {
  const loadingScreen({Key? key}) : super(key: key);

  @override
  State<loadingScreen> createState() => _loadingScreenState();
}

class _loadingScreenState extends State<loadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.deep_orange,
      body:buildBody(context)
    );

}

Widget buildBody(BuildContext context) {
  return FutureBuilder(
    future: _Homepage(),
    builder: (context, snapshot) {
      return Center(child: Container(


        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/LoadSc.png'),
              fit: BoxFit.fill
          ),
        ),
        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30.h),
              CircularProgressIndicator(color:Colors.white),
            ],
          ),
        ),
      ) ,);
    },
  );
}

Future<String> _Homepage() async {
  await Future.delayed(Duration(seconds: 3)).then((value) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Sizer(
            builder: (context, orientation, deviceType) {
              return MainWidget();
            }
          );
        },
      ),
    );
  });
  return "Homepage";
}
}
