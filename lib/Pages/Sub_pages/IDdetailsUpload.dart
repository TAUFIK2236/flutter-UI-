import 'dart:io';

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
                    ? ClipOval(
                        child: Image.file(
                          (_image!),
                          height: 18.h,
                          width: 29.w,
                          fit: BoxFit.cover,
                        ),
                      )
                    : ClipOval(
                        child: Image.network(
                          "https://scontent-lga3-1.xx.fbcdn.net/v/t1.6435-9/97475929_1585253288304566_307944989004922880_n.jpg?stp=dst-jpg_s640x640&_nc_cat=104&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=wv94PQYjsf0AX-8gwv1&_nc_ht=scontent-lga3-1.xx&oh=00_AfDj9OQC_JdqRlsJB6GLE2Ie88v86xv2KfEG3RW1h2jAzQ&oe=63F71E48",
                          height: 18.h,
                          width: 29.w,
                          fit: BoxFit.cover,
                        ),
                      ),

                // backgroundImage:NetworkImage(
                //     "https://scontent-lga3-1.xx.fbcdn.net/v/t1.6435-9/97475929_1585253288304566_307944989004922880_n.jpg?stp=dst-jpg_s640x640&_nc_cat=104&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=wv94PQYjsf0AX-8gwv1&_nc_ht=scontent-lga3-1.xx&oh=00_AfDj9OQC_JdqRlsJB6GLE2Ie88v86xv2KfEG3RW1h2jAzQ&oe=63F71E48"
                // ),

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
            "Someone",
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
            "Someone@gmail.com",
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );

    var header = Row(
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
          onPressed: () {},
        ),
        SizedBox(width: 4.w),
      ],
    );

    return Scaffold(
        backgroundColor: Colors.black87,
        body: Column(
          children: [
            SizedBox(
              height: 4.h,
            ),
            header,
            profileInfo,
          ],
        ));
  }
}
