import 'package:design/Pages/Sub_pages/ID_pages/IDdetailsUpload.dart';
import 'package:design/Pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:sizer/sizer.dart';


class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  late KFDrawerController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: MainHomePage(),
      items: [
        KFDrawerItem.initWithPage(
          text: Text(
            'Home',
            style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 15.sp),
          ),
          icon: Icon(
            Icons.home,
            color: Colors.white,
            size: 20.sp,
          ),
          page: MainHomePage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Profile',
            style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 15.sp),
          ),
          icon: Icon(
            Icons.account_circle,
            color: Colors.white,
            size: 20.sp,
          ),
          page: Profile(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: KFDrawer(
          borderRadius: 5.0.sp,
          shadowBorderRadius: 20.0.sp,
          menuPadding: EdgeInsets.all(22.0.sp),
          scrollable: true,
          controller: _drawerController,
          // header: Align(
          //   alignment: Alignment.centerLeft,
          //   child: Container(
          //     color: Colors.blue,
          //     padding: EdgeInsets.symmetric(horizontal: 16.0),
          //     width: MediaQuery.of(context).size.width * 0.6,
          //     child: Image.network(
          //       'https://img.lovepik.com/element/40132/3240.png_300.png',
          //       alignment: Alignment.centerLeft,
          //     ),
          //   ),
          // ),

          footer: KFDrawerItem(
            onPressed: (){SystemNavigator.pop();},
            text: Text("Exit",style: TextStyle(color: Colors.white,fontSize: 15.sp,fontWeight: FontWeight.bold,),),
           icon:
            Icon( Icons.exit_to_app_outlined,
                color: Colors.white,
                size: 20.sp),



          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 154, 80, 41),
                Color.fromRGBO(32, 33, 33, 1.0)
              ],
              tileMode: TileMode.repeated,
            ),
          ),
        ),
      ),
    );
  }
}
