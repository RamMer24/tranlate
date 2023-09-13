import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tranlate/Modals/ViewProfileModal.dart';
import 'package:tranlate/Provider/authprovider.dart';
import 'package:tranlate/Screen/MainPage.dart';
import 'package:tranlate/Screen/UpdateProfile.dart';
import 'package:tranlate/Widget/bottombar.dart';
import 'package:tranlate/Widget/buildErrorDialog.dart';
import 'package:tranlate/Widget/const.dart';
import 'package:tranlate/Widget/loader.dart';



class profilepage extends StatefulWidget {
  const profilepage({super.key});

  @override
  State<profilepage> createState() => _profilepageState();
}


  class _profilepageState extends State<profilepage> {
    bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewap();
  }
  @override
  Widget build(BuildContext context) {
    return commanScreen(isLoading: isLoading,
      scaffold: Scaffold(
        bottomNavigationBar: bottombar(),
        body: SingleChildScrollView(
          child: isLoading?Container():Column(children: [
            SizedBox(
              height: 5.h,
            ),
            ListTile(
              leading: GestureDetector(
                onTap: (){
                // /*  Navigator.pop(context);*/
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MainPage()));
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
              ),
              title: Center(
                  child: Text(
                "My profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,fontFamily: "task"),
              )),
              // trailing: Icon(
              //   Icons.edit_calendar_outlined,
              //   size: 25,
              // ),
            ),
           SizedBox(
             height: 2.h,
           ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 25.5.w,
                    height: 25.5.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // image: DecorationImage(
                      //     image: NetworkImage("https://images.pexels.com/photo"
                      //         "s/11766081/pexels-photo-11766081.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load"),
                      //     fit: BoxFit.fill),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: CachedNetworkImage(
                        imageUrl:   viewProfileModal?.clientData?.profileImg ?? '',
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                               ),
                          ),
                        ),
                        placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  SizedBox(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          viewProfileModal?.clientData?.userName== '' ||viewProfileModal?.clientData?.userName   == null ?'N/A': viewProfileModal?.clientData?.userName ?? '',
                          style:
                              TextStyle(fontSize: 27, fontWeight: FontWeight.bold,fontFamily: "task"),
                        ),

                        Text(
                          viewProfileModal?.clientData?.email== '' ||viewProfileModal?.clientData?.email   == null ?'N/A': viewProfileModal?.clientData?.email ?? '',
                          style:
                              TextStyle(fontSize: 22, fontWeight: FontWeight.normal,fontFamily: "task"),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Container(
              width: 65.w,
              height: 5.h,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>UpdateProfile()));
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    primary: Color(0xff0165FF)),
                child: Text(
                  "Update Profile",
                  style: TextStyle(color: Colors.white, fontSize: 19.sp,fontFamily: "task"),
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),

            SizedBox(
              height: 3.h,
            ),
            SizedBox(
              width: 90.w,
              child: Row(
                children:[
                  Icon(
                    Icons.people,size: 27,
                    color: Colors.black.withOpacity(0.6),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Container(
                    width: 75.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Gender",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 22,fontFamily: "task"),),
                        Text(
                          viewProfileModal?.clientData?.gender== '' ||viewProfileModal?.clientData?.gender   == null ?'N/A': viewProfileModal?.clientData?.gender ?? '',
                          style:  TextStyle(color: Colors.black87,fontFamily: "task",fontSize: 24),),
                        Divider(
                          endIndent: 10,
                          indent:1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            SizedBox(
              width: 90.w,
              child: Row(
                children: [
                  Icon(
                    Icons.phone,size: 27,
                    color: Colors.black.withOpacity(0.4),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Container(
                    width: 75.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Phone",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 22,fontFamily: "task")),
                        Text(
                          viewProfileModal?.clientData?.mobile== '' ||viewProfileModal?.clientData?.mobile   == null ?'N/A': viewProfileModal?.clientData?.mobile ?? '',
                          style: TextStyle(color: Colors.black87,fontFamily: "task",fontSize: 23),),
                        Divider(
                          endIndent: 10,
                          indent:1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 3.h,
            ),
            SizedBox(
              width: 90.w,
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,size: 27,
                    color: Colors.black.withOpacity(0.4),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Container(
                    width: 75.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Address",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 22,fontFamily: "task"),),
                        Text(
                          viewProfileModal?.clientData?.address== '' ||viewProfileModal?.clientData?.address   == null ?'N/A': viewProfileModal?.clientData?.address  ?? '',
                          style: TextStyle(color: Colors.black87,fontFamily: "task",fontSize: 24),),
                        Divider(
                          endIndent: 10,
                          indent:1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]
           ),
        ),
      ),
    );
  }


  viewap(){

    final Map<String, String> data = {};
    data['id'] = (usermodal?.userData?.uid).toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().ViewProfile(data).then((response) async {
          viewProfileModal =
              ViewProfileModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 &&
              viewProfileModal?.status == "success") {
         print(viewProfileModal?.clientData?.mobile);
         print( viewProfileModal?.status);
            setState(() {
        isLoading = false;
            });
          } else {
            setState(() {
              isLoading = false;
            });
          }
        });
      } else {
        setState(() {
         isLoading = false;
        });
        buildErrorDialog(context, '', "Internet Required");
      }
    });
  }
}
