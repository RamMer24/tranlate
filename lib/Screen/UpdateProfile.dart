import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tranlate/Modals/UpdateProfileModal.dart';
import 'package:tranlate/Modals/ViewProfileModal.dart';
import 'package:tranlate/Provider/authprovider.dart';
import 'package:tranlate/Screen/profilepage.dart';
import 'package:tranlate/Widget/buildErrorDialog.dart';
import 'package:tranlate/Widget/const.dart';
import 'package:tranlate/Widget/loader.dart';


class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  TextEditingController _username = TextEditingController();
  TextEditingController _gender = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _loction = TextEditingController();
  TextEditingController _email = TextEditingController();

  ImagePicker picker = ImagePicker();

  bool isLoading = true;

  String selected = 'Male';


  final _formKey = GlobalKey<FormState>();

  File? selectedimage = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    viewap();

    setState(() {
      selected = viewProfileModal?.clientData?.gender == ''|| viewProfileModal?.clientData?.gender == null?'':(viewProfileModal?.clientData?.gender).toString();
      print(selected);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: commanScreen(isLoading: isLoading,
          scaffold: Scaffold(
              body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child:isLoading?Container(): Column(children: [
                SizedBox(
                  height: 5.h,
                ),
                ListTile(
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                    ),
                  ),
                  title: Center(
                      child: Text(
                    "Edit Parsonal Info",
                    style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: "task"),
                  )),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Stack(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      child: selectedimage == null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(150),
                              child: Image.network(
                                viewProfileModal?.clientData?.profileImg ?? '',
                                fit: BoxFit.cover,
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(150),
                              child: Image.file(
                                selectedimage!,
                                fit: BoxFit.cover,
                              )),
                    ),
                    Positioned(
                      top: 79,
                      right: 5,
                      child: GestureDetector(
                          onTap: () async {
                            final XFile? photo = await picker.pickImage(
                                source: ImageSource.gallery);

                            setState(() {
                              selectedimage = File(photo!.path);
                              print(selectedimage);
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(2.w),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(width: 1, color: Colors.white),
                              color: Colors.black,
                            ),
                            child: Icon(
                              Icons.add_a_photo_sharp,
                              color: Colors.white,
                              size: 20,
                            ),
                          )),
                    )
                  ],
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25),
                //   child: Row(
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       Container(
                //         width: 110,
                //         height: 110,
                //         decoration: BoxDecoration(
                //           shape: BoxShape.circle,
                //           image: DecorationImage(
                //               image: NetworkImage("https://cdn.pixabay.com/photo/2023/06/18/04/57/crimson-collared-tanager-8071235_640.jpg"),
                //               fit: BoxFit.fill),
                //         ),
                //       ),
                //       SizedBox(
                //         width: 2.h,
                //       ),
                //       SizedBox(
                //         width: 200,
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //
                //              Container(
                //                height: 5.h,
                //                width: 50.w,
                //                alignment: Alignment.center,
                //                decoration: BoxDecoration(
                //                  borderRadius: BorderRadius.circular(30,),
                //                  border: Border.all(color: Colors.grey,width: 1,)
                //                ),
                //                child: Text("Change Profile Picture",style: TextStyle(color: Colors.black87,fontFamily: "task",fontSize: 22,fontWeight: FontWeight.bold),),
                //              ),
                //           ],
                //         ),
                //       )
                //     ],
                //   ),
                // ),

                SizedBox(
                  height: 3.5.h,
                ),

                SizedBox(
                  width: 90.w,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 3.w,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                SizedBox(
                  width: 90.w,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 3.w,
                      ),
                      Container(
                        width: 85.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "User Name",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontFamily: "task",
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter The User Name";
                                }
                                return null;
                              },
                              controller: _username,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(color: Colors.grey)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(color: Colors.grey)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(color: Colors.grey)),
                                hintText: 'Name',
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                    fontSize: 16.sp,
                                    fontFamily: "task"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                SizedBox(
                  width: 90.w,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 3.w,
                      ),
                      Container(
                        width: 85.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontFamily: "task",
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter Email";
                                } else {
                                  bool emailValid = RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value);
                                  if (!emailValid) {
                                    return "Invalid Email";
                                  }
                                }
                                return null;
                              },
                              controller: _email,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(color: Colors.grey)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(color: Colors.grey)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(color: Colors.grey)),
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                    fontSize: 16.sp,
                                    fontFamily: "task"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 90.w,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 3.w,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                SizedBox(
                  width: 90.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 2.2.w),
                        child: Text(
                          "Gender",
                          style: TextStyle(
                              color: Colors.black87,
                              fontFamily: "task",
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      // Container(
                      //   width: 85.w,
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         "Gender",
                      //         style: TextStyle(
                      //             color: Colors.black87,
                      //             fontFamily: "task",
                      //             fontSize: 17.sp,
                      //             fontWeight: FontWeight.bold),
                      //       ),
                      //       TextFormField(
                      //         validator: (value) {
                      //           if (value!.isEmpty) {
                      //             return "Please Enter The Gender";
                      //           }
                      //           return null;
                      //         },
                      //         controller: _gender,
                      //         decoration: InputDecoration(
                      //           enabledBorder: OutlineInputBorder(
                      //               borderRadius: BorderRadius.circular(30),
                      //               borderSide: BorderSide(color: Colors.grey)),
                      //           disabledBorder: OutlineInputBorder(
                      //               borderRadius: BorderRadius.circular(30),
                      //               borderSide: BorderSide(color: Colors.grey)),
                      //           focusedBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(30),
                      //             borderSide: BorderSide(color: Colors.grey),
                      //           ),
                      //           border: OutlineInputBorder(
                      //               borderRadius: BorderRadius.circular(30),
                      //               borderSide: BorderSide(color: Colors.grey)),
                      //           hintText: 'Gender',
                      //           hintStyle: TextStyle(
                      //               color: Colors.black.withOpacity(0.6),
                      //               fontSize: 16.sp,
                      //               fontFamily: "task"),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Container(
                      //     width: 85.w,
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(25.0),
                      //     ),
                      //     child:  DropdownButton(
                      //       value: selected,
                      //       onChanged: (val) {
                      //         setState(() {
                      //           selected = val!;
                      //         });
                      //       },
                      //       items: [
                      //         DropdownMenuItem(
                      //           child: Text("Male"),
                      //           value: "Male",
                      //         ),
                      //         DropdownMenuItem(
                      //           child: Text("Female"),
                      //           value: "Female",
                      //         ),
                      //
                      //       ],
                      //     ),
                      // )
                      Padding(
                        padding: EdgeInsets.only(left: 2.w),
                        child: Container(
                          height: 8.h,
                          width: 85.w,
                          child: DropdownButtonFormField(
                              borderRadius: BorderRadius.circular(30),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                  borderSide: BorderSide(color: Colors.grey)),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                  borderSide: BorderSide(color: Colors.grey)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                  borderSide: BorderSide(color: Colors.grey)),
                              // filled: true,
                              hintStyle: TextStyle(
                                  // color: Colors.grey[800]
                                  ),
                              hintText: "Select your Gender",
                            ),
                            value: selected,
                            onChanged: (val) {
                              setState(() {
                                selected = val!;
                              });
                            },
                            items: [
                              DropdownMenuItem(
                                child: Text("Select you Gender"),
                                value: "",
                              ),DropdownMenuItem(
                                child: Text("Male"),
                                value: "male",
                              ),
                              DropdownMenuItem(
                                child: Text("Female"),
                                value: "female",
                              )
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        width: 90.w,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            Container(
                              width: 85.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Phone",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontFamily: "task",
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter The Number";
                                      }
                                      return null;
                                    },
                                    controller: _phone,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      hintText: 'Phone',
                                      hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.6),
                                          fontSize: 16.sp,
                                          fontFamily: "task"),

                                    ),

                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      SizedBox(
                        width: 90.w,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            Container(
                              width: 85.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Address",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontFamily: "task",
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter The Address";
                                      }
                                      return null;
                                    },
                                    controller: _loction,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      hintText: 'Address',
                                      hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.6),
                                          fontSize: 16.sp,
                                          fontFamily: "task"),
                                    ),
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
                      Container(
                        width: 83.w,
                        height: 6.5.h,
                        child: ElevatedButton(
                          onPressed: () {
                           selected != '' ?editap(): buildErrorDialog(
                                context, 'Field Error', "Please select Gender");
                          },

                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              primary: Color(0xff0165FF)),
                          child: Text(
                            "Save",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.sp,
                                fontFamily: "task"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          )),
        ));
  }

  editap() {
    if (_formKey.currentState!.validate()) {
      final Map<String, String> data = {};
      data['id'] = usermodal?.userData?.uid ?? '';
      data['client_name'] = _username.text.toString();
      data['address'] = _loction.text.toString();
      data['gender'] = selected.toString();
      data['mobile'] = _phone.text.toString();
      data['email'] = _email.text;
      data['profile_img'] =
          selectedimage?.path == null ? '' : selectedimage?.path ?? "";
      print(data);

      checkInternet().then((internet) async {
        print('hello');
        if (internet) {
          authprovider().profileupdateapi(data).then((response) async {
            updateprofilemodal =
                UpdateProfileModal.fromJson(json.decode(response.body));
            if (response.statusCode == 200 &&
                updateprofilemodal?.status == "success") {
              update(context, '', 'Profile Updated Successfully',
                  callback: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => profilepage()));
              });
              // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>profilepage()));

              setState(() {
                isLoading = false;
              });
            } else {
              buildErrorDialog(
                  context, '', "This Email Is Already Registered");
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

  viewap() {
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
            setState(() {
              isLoading = false;
              _username.text = viewProfileModal?.clientData?.userName ?? "";

              _phone.text = viewProfileModal?.clientData?.mobile ?? "";
              _loction.text = viewProfileModal?.clientData?.address ?? "";
              _email.text = viewProfileModal?.clientData?.email ?? "";
            });
          } else {
            isLoading = false;
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
