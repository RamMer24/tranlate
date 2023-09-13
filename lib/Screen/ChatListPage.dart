import 'dart:async';
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tranlate/Modals/ChatListModal2.dart';
import 'package:tranlate/Provider/authprovider.dart';
import 'package:tranlate/Screen/MessagePage.dart';
import 'package:tranlate/Widget/buildErrorDialog.dart';
import 'package:tranlate/Widget/const.dart';
import 'package:tranlate/Widget/drawer.dart';
import 'package:tranlate/Widget/loader.dart';


class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class chat {
  String profilephoto;
  String username;
  String title;
  String time;

  chat(this.profilephoto, this.username, this.title, this.time);
}

class _ChatListPageState extends State<ChatListPage> {
  List<chat> data =[
    chat(
        "https://images.unsplash.com/photo-1533450718592-29d45635f0a9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8anBnfGVufDB8fDB8fHww&w=1000&q=80",
        'Wisdom loy',
        'Flutter Besides',
        "02:40 PM"),
    chat(
        "https://media.istockphoto.com/id/1445320095/photo/a-nomadic-family-in-the-middle-of-nowhere-gobi-desert-in-umnugovi-region-mongolia.webp?b=1&s=170667a&w=0&k=20&c=Pm89eyO4mzoSg6gWCZ84Q0zJBaWxfb1i6xeVf6mlcuE=",
        'Aum Eftiyaz',
        'Flutter Besides and Flutter Besides and',
        "03:20 AM"),
    chat(
        "https://media.istockphoto.com/id/1464561797/photo/artificial-intelligence-processor-unit-powerful-quantum-ai-component-on-pcb-motherboard-with.webp?b=1&s=170667a&w=0&k=20&c=AeBEFdsaJZmhbPHGocUkCutsQuR2rt828Aa8bDHyiOo=",
        'Moksh Luniyal',
        'Flutter this scenario Flutter a simple and high performance framework based on Dart language ',
        "10:59 PM"),
    chat(
        "https://media.istockphoto.com/id/1448432269/photo/a-boy-with-his-ball-in-the-nomadic-tent-of-the-lonely-atar-steppe-tuv-region-in-mongolia.webp?b=1&s=170667a&w=0&k=20&c=4I9sxqax2Q_Dk25s4loFsSA_Zfhg2RksPEppdSepwBQ=",
        'Rishi Khatri',
        'This scenario, Flutter a simple and high performance framework ',
        "05:30 PM"),
    chat(
        "https://images.unsplash.com/photo-1601902572612-3c850fab3ad8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8anBnfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
        'Laksh Akter',
        'Flutter Besides Flutter also offers many ready to use widgets (UI)',
        "11:59 PM"),
    chat(
        "https://images.unsplash.com/photo-1533450718592-29d45635f0a9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8anBnfGVufDB8fDB8fHww&w=1000&q=80",
        'Moksh Dude',
        'Flutter Flutter also offers many ready to use widgets (UI) to create a modern application Besides',
        "02:09 AM"),
    chat(
        "https://images.unsplash.com/photo-1598970829637-89b81d47ae27?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8anBnfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
        'Zayn Khan',
        'Flutter Besides',
        "08:59 AM"),
    chat(
        "https://images.unsplash.com/photo-1616951116286-109a1039275d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8anBnfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
        'Laksh Akter',
        'Flutter comes with beautiful and customizable widgets for high performance and',
        "09:39 AM"),
    chat(
        "https://images.unsplash.com/photo-1643270650324-f06418d5081a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGpwZ3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",
        'Dhairya Waishval',
        'Flutter simplicity makes it a good candidate for fast development Its customization capability and extendibility',
        "04:59 PM"),
    chat(
        "https://images.unsplash.com/photo-1630418886128-458aea8716d8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGpwZ3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",
        'Elil Tadpodeed',
        'Flutter is yet another framework to create mobile application. Developers are having ',
        "12:10 PM"),
  ];
  bool isLoading = true;
  TextEditingController _serch = TextEditingController();
  String? myid;
  Timer? _timer;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //chat list first api
    // chatlistap();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      chatlistapii();
    });


    setState(() {
      myid = usermodal?.userData?.uid;
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
          key: _scaffoldKey,
          drawer: drawer1(),
          body: SingleChildScrollView(
            child: isLoading
                ? Container()
                : Column(
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 1.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(Icons.arrow_back_ios),
                            ),
                            Text(
                              "Chat List",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "task"),
                            ),
                            IconButton(
                                onPressed: () {
                                  _scaffoldKey.currentState?.openDrawer();
                                },
                                icon: Icon(Icons.menu,)),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 85.h,
                            margin: EdgeInsets.symmetric(
                                horizontal: 3.w, vertical: 1.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xfffefefe)),
                            child: GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MessagePage(
                                            name: chatlistmodal2
                                                ?.adminData?.userName,
                                            photo: chatlistmodal2
                                                ?.adminData?.profileImg,
                                            id: chatlistmodal2?.adminData?.uid,
                                          )))   ,
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 3.w, vertical: 1.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 16.w,
                                          height: 7.h,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.cyan,
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(150),
                                            child: CachedNetworkImage(
                                              imageUrl: chatlistmodal2
                                                              ?.adminData
                                                              ?.profileImg ==
                                                          '' ||
                                                      chatlistmodal2?.adminData
                                                              ?.profileImg ==
                                                          null
                                                  ? 'N/A'
                                                  : chatlistmodal2?.adminData
                                                          ?.profileImg ??
                                                      '',
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
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.error),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 4.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              chatlistmodal2?.adminData
                                                              ?.userName ==
                                                          '' ||
                                                      chatlistmodal2?.adminData
                                                              ?.userName ==
                                                          null
                                                  ? 'N/A'
                                                  : chatlistmodal2?.adminData
                                                          ?.userName ??
                                                      '',
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontFamily: "task",
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Row(
                                              children:[
                                                SizedBox(
                                                  width: 50.w,
                                                  child: Text(
                                                    chatlistmodal2?.adminData
                                                                    ?.time ==
                                                                '' ||
                                                            chatlistmodal2
                                                                    ?.adminData
                                                                    ?.msg ==
                                                                null
                                                        ? "No Message"
                                                        : chatlistmodal2
                                                                    ?.adminData
                                                                    ?.fromUserId ==
                                                                myid
                                                            ? chatlistmodal2
                                                                        ?.adminData
                                                                        ?.messageType ==
                                                                    '1'
                                                                ? 'Me : ' +
                                                                    (chatlistmodal2
                                                                            ?.adminData
                                                                            ?.msg)
                                                                        .toString()
                                                                : chatlistmodal2
                                                                            ?.adminData
                                                                            ?.messageType ==
                                                                        '2'
                                                                    ? 'Me : Photo'
                                                                    : 'Me : Video'
                                                            : chatlistmodal2
                                                                        ?.adminData
                                                                        ?.messageType ==
                                                                    '1'
                                                                ?(chatlistmodal2
                                                                        ?.adminData
                                                                        ?.msg)
                                                                    .toString()
                                                                :chatlistmodal2
                                                                            ?.adminData
                                                                            ?.messageType ==
                                                                        '2'
                                                                    ? 'Photo'
                                                                    : 'Video',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 11.sp,
                                                        fontFamily: "task"),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          chatlistmodal2?.adminData?.time ==
                                                      '' ||
                                                  chatlistmodal2
                                                          ?.adminData?.time ==
                                                      null
                                              ? ''
                                              : (chatlistmodal2
                                                      ?.adminData?.time)
                                                  .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 10.sp,
                                              fontFamily: "task"),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }


  // chat list api 1

  // chatlistap() async {
  //   final Map<String, String> data = {};
  //   data['client_id'] = (usermodal?.userData?.uid).toString();
  //   print(data);
  //   checkInternet().then((internet) async {
  //     if (internet) {
  //       authprovider().ChatListApi(data).then((response) async {
  //         chatlistmodal = ChatListModal.fromJson(json.decode(response.body));
  //         print(chatlistmodal?.status);
  //         if (response.statusCode == 200 &&
  //             chatlistmodal?.status == "success") {
  //
  //           print('EE Thay Gyu Hooooo ! ^_^');
  //           // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MainPage()));
  //
  //           setState(() {
  //             isLoading = false;
  //           });
  //         } else {
  //           setState(() {
  //             isLoading = false;
  //           });
  //         }
  //       });
  //     } else {
  //       setState(() {
  //         isLoading = false;
  //       });
  //       buildErrorDialog(context, 'Error', "Internet Required");
  //     }
  //   });
  // }

  // ______________________
  //    serch api ///

  // serchap() async {
  //   final Map<String, String> data = {};
  //   data['client_id'] = (usermodal?.userData?.uid).toString();
  //   data['keyword'] = _serch.text.toString();
  //   print(data);
  //   checkInternet().then((internet) async {
  //     if (internet) {
  //       authprovider().Serchapi(data).then((response) async {
  //         searchlistmodal =
  //             SearchListModal.fromJson(json.decode(response.body));
  //         print(searchlistmodal?.status);
  //         if (response.statusCode == 200 &&
  //             searchlistmodal?.status == "success") {
  //           print('EE Thay Gyu Hooooo ! ^_^');
  //           // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MainPage()));
  //
  //           setState(() {
  //             isLoading = false;
  //           });
  //         } else {
  //
  //           setState(() {
  //             isLoading = false;
  //           });
  //         }
  //       });
  //     } else {
  //       setState(() {
  //         isLoading = false;
  //       });
  //       buildErrorDialog(context, 'Error', "Internet Required");
  //     }
  //   });
  // }

  chatlistapii() async {
    final Map<String, String> data = {};
    data['login_id'] = (usermodal?.userData?.uid).toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().ChatListApi2(data).then((response) async {
          chatlistmodal2 = ChatListModal2.fromJson(json.decode(response.body));

          if (response.statusCode == 200 &&
              chatlistmodal2?.status == "success") {



            // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MainPage()));

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
        setState(() {});
        buildErrorDialog(context, '', "Internet Required");
      }
    });
  }
}
