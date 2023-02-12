import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


String UserName = "Someone";
String UserEmail = "Someone@email.com";


class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final NameUser = TextEditingController();
  final Email = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile Information"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Your Name :"),
              SizedBox(height: 1.h),
              TextField(
                controller: NameUser,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Name",
                    suffixIcon: IconButton(
                      onPressed: () {
                        NameUser.clear();
                      },
                      icon: Icon(Icons.clear),
                    )),
              ),
              SizedBox(
                height: 7.h,
              ),
              Text("Email:"),
              SizedBox(height: 1.h),
              TextField(
                controller: Email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "anyUserInput@email.com",
                  suffixIcon: IconButton(
                    onPressed: () {
                      Email.clear();
                    },
                    icon: Icon(Icons.clear),
                  ),
                ),
              ),
              SizedBox(
                height: 7.h,
              ),
              Center(
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      UserName = NameUser.text;
                      UserEmail = Email.text;
                    });
                    Navigator.of(context).pop();
                  },
                  color: Colors.blue,
                  child: Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
