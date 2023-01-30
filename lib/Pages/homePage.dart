import 'package:design/Pages/Sub_pages/Tab_bar_page/Adidas_pro.dart';
import 'package:design/Pages/Sub_pages/Tab_bar_page/Nike_pro.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../utilities/searchBar.dart';
import 'Sub_pages/Tab_bar_page/All_pro.dart';
import 'Sub_pages/Tab_bar_page/uf_pro.dart';
import 'package:kf_drawer/kf_drawer.dart';

class homePage extends KFDrawerContent {
  // const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        // drawer: MainWidget(),
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: const Text("Welcome"),
          leading: GestureDetector(
            onTap: widget.onMenuPressed,
            child: Container(
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
              height: 2.h,
              width: 1.h,
              child: const Icon(
                Icons.menu, color: Colors.white70, // add custom icons also
              ),
            ), // add custom icons also
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(2.sp),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black12,
                      width: 1.sp,
                    ),
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(
                      10.sp,
                    )),
                child: Center(
                  child: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: MySearchDelegate(),
                        );
                      }),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(2.sp),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black12,
                      width: 1.sp,
                    ),
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(
                      10.sp,
                    )),
                child: IconButton(
                    icon: const Icon(Icons.shopping_cart), onPressed: () {}),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(2.sp),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black12,
                      width: 1.2.sp,
                    ),
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(
                      10.sp,
                    )),
                child: IconButton(
                    icon: const Icon(Icons.favorite), onPressed: () {}),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(2.sp),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black12,
                      width: 1.2.sp,
                    ),
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(
                      10.sp,
                    )),
                child: IconButton(
                    icon: const Icon(Icons.add_alert), onPressed: () {}),
              ),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "All",
              ),
              Tab(
                text: "Adidas",
              ),
              Tab(
                text: "Nike",
              ),
              Tab(
                text: "UF Pro",
              ),
            ],
            labelColor: Colors.white,
            labelStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: TextStyle(fontSize: 16),
          ),
        ),
        body: const TabBarView(
          children: [
            All_product(),
            Adidas(),
            NikePro(),
            uf_pro(),
          ],
        ),
      ),
    );
  }
}
