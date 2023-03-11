import 'package:design/utilities/Drawr.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';





class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body:buildBody(context)
    );

}

Widget buildBody(BuildContext context) {
  return FutureBuilder(
    future: _homepage(),
    builder: (context, snapshot) {
      return Center(child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/LoadSc.png'),
              fit: BoxFit.contain
          ),
        ),
        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30.h),
              const CircularProgressIndicator(color:Colors.black),
            ],
          ),
        ),
      ) ,);
    },
  );
}

Future<String>_homepage() async {
  await Future.delayed(const Duration(seconds: 3)).then((value) {
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
