import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:sizer/sizer.dart';
import 'package:tranlate/Modals/ChatViewModal.dart';
import 'package:tranlate/Modals/MessSendModal.dart';
import 'package:tranlate/Provider/authprovider.dart';
import 'package:tranlate/Widget/VideoPlay.dart';
import 'package:tranlate/Widget/buildErrorDialog.dart';
import 'package:tranlate/Widget/const.dart';
import 'package:tranlate/Widget/loader.dart';

import '../Widget/drawer.dart';

class MessagePage extends StatefulWidget {
  String? id;
  String? name;
  String? photo;

  MessagePage({super.key, this.id, this.name, this.photo});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  TextEditingController _sendmess = TextEditingController();

  bool _showemoji = false;
  int? type;
  Timer? _timer;
  bool isLoading = true;
  bool send = false;

  ImagePicker _picker = ImagePicker();
  File? _pickedFile = null;
  var photo = "";
  String? mimeType;
  String? senderid;

  bool _isPlaying = false;

  @override
  void initState() {
    // TODO: implement initState
    print(widget.id);
    print(usermodal?.userData?.uid);
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      chatviewapi();
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: commanScreen(
        isLoading: isLoading,
        scaffold: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(7.h),
            child: AppBar(
              leadingWidth: MediaQuery.of(context).size.width,
              titleSpacing: 0,
              backgroundColor: Color(0xff0165FF) ,
              leading:  Padding(
                padding:  EdgeInsets.symmetric(horizontal: 5.w),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(
                        //   height: 7.h,
                        // ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(

                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 13.w,
                                  height: 6.h,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.cyan),
                                  child: ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(150),
                                    child: CachedNetworkImage(
                                      imageUrl: widget.photo.toString(),
                                      imageBuilder:
                                          (context, imageProvider) =>
                                          Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  widget.name.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.sp,
                                      fontFamily: "task",
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
            body: isLoading
                ? Container()
                : Stack(
                children:[
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(

                            width: MediaQuery.of(context).size.width,
                            height: 75.h,
                            child: chatviewmodal?.status == "false"
                                ? Center(
                                    child: Text(
                                    "No Messages",
                                    style: TextStyle(
                                        fontFamily: "task",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.sp,
                                        color: Colors.black),
                                  ))
                                :Column(
                                    children: [
                                      Container(

                                        width: MediaQuery.of(context).size.width,
                                        height: 70.h,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          reverse: true,
                                          itemCount: chatviewmodal?.allChat?.length,
                                          itemBuilder: (context, index) {
                                            return chatviewmodal?.allChat?[index]
                                                        .fromUserId ==
                                                    usermodal?.userData?.uid
                                                ? Align(
                                                    alignment: Alignment.topRight,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.end,
                                                      children: [
                                                        Container(
                                                            margin:
                                                                EdgeInsets.symmetric(
                                                                    horizontal: 1.h,
                                                                    vertical: 3.w),
                                                            alignment:
                                                                Alignment.centerLeft,
                                                            padding:
                                                                EdgeInsets.symmetric(
                                                                    horizontal: 1.h,
                                                                    vertical: 3.w),
                                                            width: 70.w,
                                                            decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius.only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                        30,
                                                                      ),
                                                                      topRight: Radius
                                                                          .circular(
                                                                        30,
                                                                      ),
                                                                      bottomLeft: Radius
                                                                          .circular(
                                                                        30,
                                                                      )),
                                                              color:
                                                                  Color(0xff0165FF),
                                                            ),
                                                            child: chatviewmodal
                                                                        ?.allChat?[
                                                                            index]
                                                                        .messageType ==
                                                                    "1"
                                                                ?Text(
                                                                    chatviewmodal
                                                                            ?.allChat?[
                                                                                index]
                                                                            .messages ??
                                                                        "",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            12.sp,
                                                                        fontFamily:
                                                                            "task",
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .normal),
                                                                  )
                                                                :chatviewmodal
                                                                            ?.allChat?[
                                                                                index]
                                                                            .messageType ==
                                                                        "2"
                                                                    ?InkWell(
                                                                        onTap: () {
                                                                          showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return Stack(
                                                                                children: [
                                                                                  Container(
                                                                                    padding: EdgeInsets.all(4.w),
                                                                                    margin: EdgeInsets.only(top: 1.h),
                                                                                    child: ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(20),
                                                                                      child: CachedNetworkImage(
                                                                                        imageUrl: chatviewmodal?.allChat?[index].messages ?? "",
                                                                                        height: 77.h,
                                                                                        imageBuilder: (context, imageProvider) => Container(
                                                                                          decoration: BoxDecoration(
                                                                                            image: DecorationImage(
                                                                                              image: imageProvider,
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        placeholder: (context, url)=> Center(child: CircularProgressIndicator()),
                                                                                        errorWidget: (context, url, error) => Icon(Icons.error),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Positioned(
                                                                                    left: 84.5.w,
                                                                                    top: 3.51.h,
                                                                                    child: InkWell(
                                                                                      onTap: () {
                                                                                        Navigator.pop(context);
                                                                                      },
                                                                                      child: Container(
                                                                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(90),
                                                                                              color: Colors.red,
                                                                                              border: Border.all(color: Colors.red)),
                                                                                          padding: EdgeInsets.all(2.w),
                                                                                          child: Icon(
                                                                                            Icons.close_rounded,
                                                                                            color: Colors.white,
                                                                                          )),
                                                                                    ),
                                                                                  )
                                                                                ],
                                                                              );
                                                                            },
                                                                          );
                                                                        },
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(
                                                                                  30),
                                                                          child: Image
                                                                              .network(
                                                                            chatviewmodal
                                                                                    ?.allChat?[index]
                                                                                    .messages ??
                                                                                "",
                                                                            height:
                                                                                30.h,
                                                                            width:
                                                                                70.w,
                                                                          ),
                                                                        ),
                                                                      )
                                                                    :Container(
                                                                        height: 30.h,
                                                                        width: 70.w,
                                                                        child: addvideo(
                                                                            vid: chatviewmodal
                                                                                ?.allChat?[
                                                                                    index]
                                                                                .messages),
                                                                      )),
                                                        Padding(
                                                          padding: EdgeInsets.only(
                                                              right: 1.h),
                                                          child: Text(chatviewmodal
                                                                  ?.allChat?[index]
                                                                  .time ??
                                                              ""),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                :Align(
                                                    alignment: Alignment.topLeft,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          margin:
                                                              EdgeInsets.symmetric(
                                                                  horizontal: 1.h,
                                                                  vertical: 3.w),
                                                          alignment: Alignment.center,
                                                          padding:
                                                              EdgeInsets.symmetric(
                                                            vertical: 1.5.h,
                                                          ),
                                                          width: 70.w,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius.only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                        30,
                                                                      ),
                                                                      topRight: Radius
                                                                          .circular(
                                                                        30,
                                                                      ),
                                                                      bottomRight:
                                                                          Radius
                                                                              .circular(
                                                                        30,
                                                                      )),
                                                              color:
                                                                  Color(0xfff1f4fe)),
                                                          child: SizedBox(
                                                            width: 60.w,
                                                            child: chatviewmodal
                                                                        ?.allChat?[
                                                                            index]
                                                                        .messageType ==
                                                                    "1"
                                                                ? Text(
                                                                    chatviewmodal
                                                                            ?.allChat?[
                                                                                index]
                                                                            .messages ??
                                                                        "",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            12.sp,
                                                                        fontFamily:
                                                                            "task",
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .normal),
                                                                  )
                                                                :chatviewmodal
                                                                            ?.allChat?[
                                                                                index]
                                                                            .messageType ==
                                                                        "2"
                                                                    ?InkWell(
                                                                        onTap: () {
                                                                          showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {return Stack(
                                                                                children: [
                                                                                  Container(
                                                                                    padding: EdgeInsets.all(4.w),
                                                                                    margin: EdgeInsets.only(top: 1.h),
                                                                                    child: ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(20),
                                                                                      child: CachedNetworkImage(
                                                                                        imageUrl: chatviewmodal?.allChat?[index].messages ?? "",
                                                                                        height: 90.h,
                                                                                        imageBuilder: (context, imageProvider) => Container(
                                                                                          decoration: BoxDecoration(
                                                                                            image: DecorationImage(
                                                                                              image: imageProvider,
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                                                                        errorWidget: (context, url, error) => Icon(Icons.error),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Positioned(
                                                                                    left: 83.5.w,
                                                                                    top: 3.51.h,
                                                                                    child: InkWell(
                                                                                      onTap: () {
                                                                                        Navigator.pop(context);
                                                                                      },
                                                                                      child: Container(

                                                                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(90),
                                                                                              color: Colors.red,
                                                                                              border: Border.all(color: Colors.red)),
                                                                                          padding: EdgeInsets.all(2.w),
                                                                                          child: Icon(
                                                                                            Icons.close_rounded,size: 22.sp,
                                                                                            color: Colors.white,
                                                                                          )),
                                                                                    ),
                                                                                  )
                                                                                ],
                                                                              );
                                                                            },
                                                                          );
                                                                        },
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(
                                                                                  30),
                                                                          child: Image
                                                                              .network(
                                                                            chatviewmodal
                                                                                    ?.allChat?[index]
                                                                                    .messages ??
                                                                                "",
                                                                            height:
                                                                                30.h,
                                                                            width:
                                                                                70.w,
                                                                          ),
                                                                        ),
                                                                      )
                                                                    : Container(
                                                                        height: 30.h,
                                                                        width: 70.w,
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(
                                                                                  25),
                                                                          child: addvideo(
                                                                              vid: chatviewmodal
                                                                                  ?.allChat?[index]
                                                                                  .messages),
                                                                        ),
                                                                      ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.only(
                                                              left: 1.h
                                                          ),
                                                          child:Text(chatviewmodal
                                                                  ?.allChat?[index]
                                                                  .time ??
                                                              ""),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        selectfile();
                                      },
                                      child: Icon(
                                        Icons.attach_file,
                                        size: 23.sp,
                                      )),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Container(
                                    height: 7.h,
                                    // margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal: 10,
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                          30,
                                        ),
                                        border: Border.all(color: Colors.black)),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            FocusScope.of(context).unfocus();
                                            setState(() {
                                              _showemoji = !_showemoji;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.emoji_emotions_sharp,
                                            color: Color(0xff246bfb),
                                          ),
                                        ),
                                        // SizedBox(
                                        //   width: 3.w,
                                        //),
                                        Container(
                                          width: 52.w,
                                          child: TextFormField(
                                            keyboardType: TextInputType.text,
                                            controller: _sendmess,
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                            ),
                                            onTap: () {
                                              if (_showemoji) ;
                                              setState(() {
                                                _showemoji = false;
                                              });
                                            },
                                            decoration: InputDecoration(
                                              contentPadding: EdgeInsets.symmetric(
                                                  vertical: 1.35.h),
                                              hintText: "message",
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  (isloading)
                                      ? CircularProgressIndicator()
                                      : Container(
                                    height: 5.5.h,
                                    width: 12.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Color(0xff246bfb),
                                      borderRadius: BorderRadius.circular(
                                        50,
                                      ),
                                    ),
                                    child: IconButton(
                                        onPressed: (){
                                          setState((){
                                            send = true;
                                            type = 1;
                                          });
                                          mesapi();
                                        },
                                        icon: Icon(
                                          Icons.send,
                                          color: Colors.white,
                                          size: 6.w,
                                        )),
                                  ),
                                ],
                              ),
                              (_showemoji)
                                  ? SizedBox(
                                height: MediaQuery.of(context).size.height * .35,
                                child: EmojiPicker(
                                  textEditingController: _sendmess,
                                  config: Config(
                                    columns: 7,
                                    // emojiSizeMax: 32 * (Platform.isIOS? 1.30 : 1.0),
                                  ),
                                ),
                              )
                                  : SizedBox(
                                height: 1.5.h,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Positioned(
                    //   bottom: 0.0,
                    //   left: 0.0,
                    //   child:
                    // ),
                  ])),
      ),
    );
  }

  chatviewapi() async {
    final Map<String, String> data = {};
    data['user_id'] = widget.id.toString();
    data['login_id'] = usermodal?.userData?.uid ?? "";
    print(data);
    checkInternet().then((internet) async{
      if (internet) {
        authprovider().chatviewap(data).then((response) async{
          chatviewmodal = ChatViewModal.fromJson(json.decode(response.body));
          print(chatviewmodal?.status);
          if (response.statusCode == 200 &&
              chatviewmodal?.status == "success") {
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

  mesapi() async {
    final Map<String, String> data = {};
    data['login_id'] = usermodal?.userData?.uid ?? "";
    data['user_id'] = widget.id.toString();
    data['type'] = type.toString();
    data['message'] =
        type == 1 ? _sendmess.text.toString() : _pickedFile?.path ?? "";

    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().messsendap(data).then((response) async {
          messsendmodal = MessSendModal.fromJson(json.decode(response.body));
          print(messsendmodal?.status);
          if (response.statusCode == 200 &&
              messsendmodal?.status == "success") {
            print(response.statusCode);
            _sendmess.text = "";

            setState(() {
              isLoading = false;
            });
          } else {
            buildErrorDialog(context, "", "Please type the message");
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

  selectfile() {
    AlertDialog alert =  AlertDialog(

      actions: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Column(
                //   children: [
                //     IconButton(
                //         onPressed: () async {
                //           print("jfshjfsdf");
                //           FilePickerResult? result =
                //               await FilePicker.platform.pickFiles();
                //
                //           if (result != null) {
                //             setState(() {
                //               type = 5;
                //               _pickedFile =
                //                   File(result.files.single.path.toString());
                //             });
                //           } else {}
                //           mesapi();
                //         },
                //         icon: Icon(
                //           Icons.file_copy_sharp,
                //         )),
                //     Text(
                //       "File",
                //       style: TextStyle(color: Colors.black45, fontSize: 10.sp),
                //     )
                //   ],
                // ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () async {
                          type = 2;
                          XFile? photo = await _picker.pickImage(
                              source: ImageSource.camera);
                          setState(() {
                            _pickedFile = File(photo!.path);
                            print(_pickedFile);
                            type = 2;
                          });
                          mesapi();
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.camera_alt,
                          size: 30.sp,
                          color: Color(0xff0165FF),
                        )),
                    Text(
                      "Camera",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10.sp,
                          fontFamily: "task",
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () async {
                          XFile? photo = await _picker.pickImage(
                              source: ImageSource.gallery);
                          _pickedFile = File(photo!.path);
                          setState(() {
                            _pickedFile = File(photo!.path);
                            type = 2;
                          });
                          mesapi();
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.browse_gallery,
                          size: 30.sp,
                          color: Color(0xff0165FF),
                        )),
                    Text(
                      "Gallery",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10.sp,
                          fontFamily: "task",
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),


                //**********  Video play ********** //


                // Column(
                //   children: [
                //     IconButton(
                //         onPressed: () async {
                //           // final XFile? image =
                //           // await _picker.pickVideo(
                //           //     source: ImageSource
                //           //         .gallery);
                //           // setState(() {
                //           //
                //           //   _pickedFile =
                //           //       File(image!.path);
                //           //   type = 3;
                //           // print(_pickedFile);
                //           // });
                //           XFile? photo = await _picker.pickVideo(
                //               source: ImageSource.gallery);
                //           _pickedFile = File(photo!.path);
                //           setState(() {
                //             _pickedFile = File(photo.path);
                //             type = 3;
                //             String? filePath = _pickedFile!
                //                 .path; // Replace with your file's path
                //             String? fileExtension = filePath.split('.').last;
                //             mimeType = lookupMimeType(fileExtension);
                //             print('MIME type: $mimeType');
                //           });
                //
                //           mesapi();
                //           Navigator.of(context).pop();
                //         },
                //         icon: Icon(
                //           Icons.video_call_sharp,
                //           size: 30.sp,
                //           color: Color(0xff0165FF),
                //         )),
                //     Text(
                //       "Video",
                //       style: TextStyle(
                //           color: Colors.black,
                //           fontSize: 10.sp,
                //           fontFamily: "task",
                //           fontWeight: FontWeight.bold),
                //     )
                //   ],
                // ),
              ],
            ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //
            //   ],
            // ),
          ],
        ),
      ],
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }
}
