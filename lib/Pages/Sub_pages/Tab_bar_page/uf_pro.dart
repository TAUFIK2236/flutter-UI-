import 'package:design/Pages/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';


final List<String> uf_pro_imageLinkList = [
  'https://ufpro.com/storage/app/media/Product%20Images/Pants/Striker%20HT%20Combat%20Pants/Product%20Page%20Compressed/Striker-HT-combat-pants-m-compressed.jpg',
  'https://ufpro.com/storage/app/media/product-catalog/pants/thumb/1920x1920.crop/striker-xt-gen2-combat-pants-navy-blue-hero-2019-739.jpeg',
  'https://proshoptc.com/wp-content/uploads/2021/11/Kopia-Bez-tytulu-5-600x600.png',
  'https://cdn11.bigcommerce.com/s-9c2b3nv4yu/images/stencil/1280x1280/products/458/2129/1__51870.1654883251.jpg?c=2',
  'https://ufpro.com/storage/app/media/Product%20Images/Pants/Striker%20HT%20Combat%20Pants/70620-striker-ht-combat-pants-materials_en.jpg',
];

final List<String> uf_pro_name = [
  "STRIKER HT COMBAT PANTS",
  "STRIKER XT GEN.2 COMBAT PANTS",
  "UF PRO TACTICAL WINTER JACKET DELTA ML GEN.2 STEEL GRAY",
  "UF PRO® STRIKER XT GEN.3 COMBAT SHIRT",
  "UF PRO® STRIKER HT COMBAT PANTS (Big and Tall)",
];

class uf_pro extends StatefulWidget {
  const uf_pro({Key? key}) : super(key: key);

  @override
  _uf_proState createState() => _uf_proState();
}

class _uf_proState extends State<uf_pro> {


  var ProductName = "";

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/UF_PRO.mp4')
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        _controller.setVolume(0.0);
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 1.h),
          Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2.w,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.sp),
                ),
              ),
              height: 35.h,
              width: 95.w,
              child: VideoPlayer(_controller),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0.w, 4.h, 67.0.w, 0.0.h),
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
            physics: NeverScrollableScrollPhysics(),
            itemCount: uf_pro_imageLinkList.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: .1.w,
              mainAxisSpacing: .1.h,
              childAspectRatio: 1/1.50,
            ),
            itemBuilder: (_, index) {
              ProductName = uf_pro_name[index];
              return Product(
                PRODUCTname: ProductName,
                img: uf_pro_imageLinkList[index],
              );
            },
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class Product extends StatelessWidget {
  const Product({Key? key, required this.PRODUCTname, required this.img})
      : super(key: key);

  final String PRODUCTname;
  final String img;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {Navigator.of(context).push(MaterialPageRoute(builder:(context)=>detailsPage(pic:img, name:PRODUCTname)));},
      child: Padding(
        padding: EdgeInsets.all(8.0.sp),
        child: Container(

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
                padding: EdgeInsets.fromLTRB(1.7.w, 1.h, 0.w, 0.5.h),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          img,
                        ),
                        fit: BoxFit.fill),
                    border: Border.all(
                      color: Colors.white,
                      width: 0.3.w,
                    ),
                    color: const Color(0xff524545),
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
                      PRODUCTname,
                      style: TextStyle(
                        fontSize: 10.sp,
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

  }
}
