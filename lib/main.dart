import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:design/Pages/loadngPage.dart';
import 'package:design/StateManagement/provider.dart';


void main() {
  runApp(ChangeNotifierProvider(
    create:(_)=> ProductProvider(),
   child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  Sizer(
      builder: (context, orientation, deviceType){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home:const LoadingScreen()
        //loadingScreen()
      );
      }
    );
  }
}

