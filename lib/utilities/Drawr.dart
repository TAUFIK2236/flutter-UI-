import 'package:design/Pages/Sub_pages/IDdetailsUpload.dart';
import 'package:design/Pages/homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:sizer/sizer.dart';


class MainWidget extends StatefulWidget {
  MainWidget({Key? key}) : super(key: key);

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  late KFDrawerController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: homePage(),
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
          page: homePage(),
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
    return Scaffold(
      body: KFDrawer(
        borderRadius: 30.0,
        shadowBorderRadius: 30.0,
        menuPadding: EdgeInsets.all(5.0),
        scrollable: true,
        controller: _drawerController,
        header: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            width: MediaQuery.of(context).size.width * 0.6,
            // child: Image.network(
            //   'https://img.lovepik.com/element/40132/3240.png_300.png',
            //   alignment: Alignment.centerLeft,
            // ),
          ),
        ),
        footer: KFDrawerItem(
          text: Text(
            'Exit',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(
            Icons.exit_to_app_outlined,
            color: Colors.white,
          ),
        ),
        decoration: BoxDecoration(
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
    );
  }
}
