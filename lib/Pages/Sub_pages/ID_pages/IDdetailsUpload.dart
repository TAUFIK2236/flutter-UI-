import 'dart:io';

import 'package:design/Pages/Sub_pages/ID_pages/Edit_info.dart';
import 'package:design/const/Devlop_info.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:sizer/sizer.dart';

class Profile extends KFDrawerContent {
  // const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _image;

  Future getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      this._image = imageTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    var profileInfo = Expanded(
      child: Column(
        children: [
          Container(
            height: 20.h,
            width: 30.w,
            child: Stack(
              children: [
                _image != null
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(70.sp),
                  child:  Image.file(
                    (_image!),

                    fit: BoxFit.cover,
                  ),
                )
                    : ClipRRect(
                  borderRadius: BorderRadius.circular(70.sp),
                  child: Image.network(
                          "https://i.pinimg.com/736x/d9/56/9b/d9569bbed4393e2ceb1af7ba64fdf86a.jpg",),

                        ),



                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: () => getImage(ImageSource.camera),
                    icon: Icon(
                      Icons.camera_alt,
                      size: 20.sp,
                      color: Colors.amberAccent,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            UserName,
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 0.5.h,
          ),
          Text(
            UserEmail,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );


    return Scaffold(
        backgroundColor: Colors.black87,
        body: Column(
          children: [
            SizedBox(
              height: 4.h,
            ),
            //header,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 4.w),
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: widget.onMenuPressed,
                  ),
                  //profileInfo,
                  SizedBox(
                    width: 67.w,
                  ),
                  IconButton(
                    icon: Icon(Icons.settings),
                    color: Colors.white,
                    onPressed: () async {
                     await Navigator.of(context).push(MaterialPageRoute(builder:(context)=>EditProfile()));
                     setState(() {

                     });
                    },
                  ),
                  SizedBox(width: 4.w),
                ],
              ),
            ),
            profileInfo,
            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder:(context)=>DevlopInfo()));
              },
              child: Container(
                height: 3.6.h,
                width: 5.8.w,
                decoration: BoxDecoration(

                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(-0.3.w, -0.3.h),
                        blurRadius: 5.0.sp),
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.3.w, .3.h),
                        blurRadius: 4.0.sp),
                  ],
                  color: const Color(0xff202121),
                  borderRadius: BorderRadius.all(
                    Radius.circular(100.sp),
                  ),
                ),
                child: Center(child: Icon(Icons.info_outline,size: 16.sp,color: Colors.white,)),
              ),
            ) ,
            SizedBox(height: 4.h),
          ],
        ));
  }
}
