import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart' ;
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:sizer/sizer.dart';
import 'package:tranlate/Modals/InvoiceDetailModal.dart';
import 'package:tranlate/Provider/authprovider.dart';
import 'package:tranlate/Screen/TaskList.dart';
import 'package:tranlate/Widget/buildErrorDialog.dart';
import 'package:tranlate/Widget/const.dart';
import 'package:tranlate/Widget/drawer.dart';
import 'package:tranlate/Widget/loader.dart';
import 'package:pdf/widgets.dart' as pw;

class InvoiceDetail extends StatefulWidget {
  String? id;
  int? ispaid;

  InvoiceDetail({
    super.key,
    this.id,
    required this.ispaid,
  });

  @override
  State<InvoiceDetail> createState() => _InvoiceDetailState();
}

class Item {
  String itemname;
  String hour;
  int price;
  int totalprice;

  Item(this.itemname, this.hour, this.price, this.totalprice);
}

class _InvoiceDetailState extends State<InvoiceDetail> {
  bool isLoading = true;
  List<Item> data = [
    Item("English typing ", "2 hours", 10, 20),
    Item("Movie word", "3 hours", 5, 15),
    Item("Hindi typing", "4 hours", 10, 40),
    Item("Coding", "5 hours", 6, 30),
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    invoicedetailapi();
    print(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        key: _scaffoldKey,
        drawer: drawer1(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
                onPressed: () {
                  print("data");
                  downloaddata();

                },
                backgroundColor: Color(0xff246bfb),
                child: Icon(
                  Icons.download_sharp,
                  size: 25.sp,
                  color: Colors.white,
                ),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                )),
          ],
        ),
        body: SingleChildScrollView(
          child: isLoading
              ? Container()
              : Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 4.h,
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
                              "Invoice Detail",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "task"),
                            ),
                            IconButton(
                                onPressed: () {
                                  _scaffoldKey.currentState?.openDrawer();
                                },
                                icon: Icon(Icons.menu)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(
                            vertical: 2.h, horizontal: 3.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xfffefefe),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.date_range,
                                  size: 20.sp,
                                ),
                                Text(
                                  " Invoice Date ",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'task',
                                      letterSpacing: 1,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                    invoicedetailmodal?.invoiceData?.dueDate ==
                                                '' ||
                                            invoicedetailmodal
                                                    ?.invoiceData?.dueDate ==
                                                null
                                        ? 'N/A'
                                        : invoicedetailmodal
                                                ?.invoiceData?.dueDate ??
                                            '',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: "task")),
                                SizedBox(
                                  width: 0.5.w,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xff246bfb)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 3.w),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Invoice Number",
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'task',
                                          letterSpacing: 2,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      invoicedetailmodal?.invoiceData
                                                      ?.invoiceNumber ==
                                                  '' ||
                                              invoicedetailmodal?.invoiceData
                                                      ?.invoiceNumber ==
                                                  null
                                          ? 'N/A'
                                          : invoicedetailmodal?.invoiceData
                                                  ?.invoiceNumber ??
                                              '',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: 'task',
                                          color: Colors.white70),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xfffefefe),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 3.w),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Task Title",
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'task',
                                          letterSpacing: 2,
                                          color: Colors.black),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 0.5.h),
                                      child: Text(
                                        invoicedetailmodal?.invoiceData
                                                        ?.taskName ==
                                                    '' ||
                                                invoicedetailmodal?.invoiceData
                                                        ?.taskName ==
                                                    null
                                            ? 'N/A'
                                            : invoicedetailmodal
                                                    ?.invoiceData?.taskName ??
                                                '',
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontFamily: 'task',
                                            color: Colors.black54),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xfffefefe),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 3.w),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "About Task",
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'task',
                                          letterSpacing: 2,
                                          color: Colors.black),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 2.h),
                                      child: Text(
                                        invoicedetailmodal?.invoiceData
                                                        ?.taskDescription ==
                                                    '' ||
                                                invoicedetailmodal?.invoiceData
                                                        ?.taskDescription ==
                                                    null
                                            ? 'N/A'
                                            : invoicedetailmodal?.invoiceData
                                                    ?.taskDescription ??
                                                '',
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontFamily: 'task',
                                            color: Colors.black54),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      invoicedetailmodal?.invoiceData?.taskType == '1'
                          ? Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 11.h,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 0.8.h, horizontal: 4.5.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xfffefefe),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Working Hours",
                                                style: TextStyle(
                                                    fontSize: 15.sp,
                                                    fontFamily: 'task',
                                                    color: Colors.black54),
                                              ),
                                              Text(
                                                invoicedetailmodal?.invoiceData
                                                                ?.totalTime ==
                                                            '' ||
                                                        invoicedetailmodal
                                                                ?.invoiceData
                                                                ?.totalTime ==
                                                            null
                                                    ? 'N/A'
                                                    : (invoicedetailmodal
                                                                ?.invoiceData
                                                                ?.totalTime)
                                                            .toString() +
                                                        ' Hour',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15.sp,
                                                    fontFamily: "task"),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Amount",
                                                style: TextStyle(
                                                    fontSize: 15.sp,
                                                    fontFamily: 'task',
                                                    color: Colors.black54),
                                              ),
                                              Text(
                                                invoicedetailmodal?.invoiceData
                                                                ?.taskAmount ==
                                                            '' ||
                                                        invoicedetailmodal
                                                                ?.invoiceData
                                                                ?.taskAmount ==
                                                            null
                                                    ? 'N/A'
                                                    : '\$ ' +
                                                        (invoicedetailmodal
                                                                ?.invoiceData
                                                                ?.taskAmount)
                                                            .toString() +
                                                        '/h',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15.sp,
                                                    fontFamily: "task"),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 11.h,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 2.h, horizontal: 3.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color(0xfffefefe),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 0.9.h),
                                              child: Text(
                                                "Total Hours",
                                                style: TextStyle(
                                                    fontSize: 15.sp,
                                                    fontFamily: 'task',
                                                    color: Colors.black54),
                                              ),
                                            ),
                                            SizedBox(
                                              // width: 26.w,
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 1.h),
                                                child: Text(
                                                  invoicedetailmodal
                                                                  ?.invoiceData
                                                                  ?.totalTime ==
                                                              null ||
                                                          invoicedetailmodal
                                                                  ?.invoiceData
                                                                  ?.totalTime ==
                                                              ""
                                                      ? "N/A"
                                                      : (invoicedetailmodal
                                                                  ?.invoiceData
                                                                  ?.totalTime)
                                                              .toString() +
                                                          " Hour",
                                                  style: TextStyle(
                                                      fontSize: 15.sp,
                                                      fontFamily: "task",
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: 0.8.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Total Amount",
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontFamily: 'task',
                                                  color: Colors.black54),
                                            ),
                                            SizedBox(
                                              // width: 26.w,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 0.3.h),
                                                child: Text(
                                                  '\$ ' +
                                                      (invoicedetailmodal
                                                              ?.invoiceData
                                                              ?.totalAmount)
                                                          .toString(),
                                                  style: TextStyle(
                                                      fontSize: 15.sp,
                                                      fontFamily: "task",
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )),
                              ],
                            )

                          : Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xfffefefe),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2.h, horizontal: 3.w),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Total Amount",
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                fontFamily: 'task',
                                                letterSpacing: 2,
                                                color: Colors.black54),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 0.5.h),
                                            child: Text(
                                              '\$ ' +
                                                  (invoicedetailmodal
                                                          ?.invoiceData
                                                          ?.taskAmount)
                                                      .toString(),
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontFamily: 'task',
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                      SizedBox(
                        height: 2.h,
                      ),

                      // widget.ispaid != 1 ? Container(
                      //    width: MediaQuery.of(context).size.width,
                      //    height: 5.h,
                      //    child: ElevatedButton(
                      //      onPressed: () {},
                      //      style: ElevatedButton.styleFrom(
                      //          shape: RoundedRectangleBorder(
                      //              borderRadius: BorderRadius.circular(10.0)),
                      //          primary: Color(0xff0165FF)),
                      //      child: Text(
                      //        "Pay",
                      //        style: TextStyle(
                      //            color: Colors.white,
                      //            fontSize: 18.sp,
                      //            fontFamily: "task"),
                      //      ),
                      //    ),
                      //  ):Container(),

                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xfffefefe),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 3.w),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Status",
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'task',
                                          letterSpacing: 2,
                                          color: Colors.black),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 0.5.h),
                                      child: Text(
                                        invoicedetailmodal
                                                    ?.invoiceData?.status ==
                                                '1'
                                            ? "Paid"
                                            : "Unpaid",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: 'task',
                                          fontWeight: FontWeight.bold,
                                          color: invoicedetailmodal
                                                      ?.invoiceData?.status ==
                                                  '1'
                                              ? Colors.green.shade200
                                              : Colors.red.shade200,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 1.w,
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  invoicedetailapi() async {
    final Map<String, String> data = {};
    data['invoice_id'] = widget.id.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().invoicapi(data).then((response) async {
          invoicedetailmodal =
              InvoiceDetailModal.fromJson(json.decode(response.body));
          print(invoicedetailmodal?.status);
          if (response.statusCode == 200 &&
              invoicedetailmodal?.status == "success") {
            setState(() {
              isLoading = false;
            });
          } else {
            // buildErrorDialog(context, "Error", "Email or Password wrong");
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

    Future<void> downloaddata() async {
      invoicedetailapi();


        // EasyLoading.show(status: 'Downloading...');

    final pdf = pw.Document();
    final pageWidth = PdfPageFormat.a4.width;
    // final pageHeight = 1000.0;
      final imageProvider = await loadImageFromAsset('img/logot.jpeg');
    // final imageProvider = await loadImageFromAsset(
    //   'assets/japan.png',
    // );
    // final imageProvider1 = await loadImageFromAsset('assets/footer.png');
    // final imageProvider2 = await loadImageFromAsset('assets/japan.png');
    // final imageProvider3 = await loadImageFromAsset('assets/logo.png');
    // final imageProvider4 = await loadImageFromAsset('assets/backimg.png');
    // final imageProvider5 = await loadImageFromAsset('assets/to.jpg');

    final pdfWidget = pw.Padding(
      padding: pw.EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: pw.Column(
        children: [

          // pw.SizedBox(
          //   height: 5
          // ),
        pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Container(
              width: 100,
              height: 100,
              decoration: pw.BoxDecoration(
                image: pw.DecorationImage(
                  image: imageProvider,
                  fit: pw.BoxFit.cover,
                ),
              ),),
            pw.Text(
              "Invoice",
              style:
              pw.TextStyle(fontSize: 30, fontWeight: pw.FontWeight.bold,
              color: PdfColors.blue),
            ),
          ]
        ),
          pw.SizedBox(
              height: 7
          ),

          pw.Row(
            // mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Row(
                children: [
                  pw.Text(
                    "Invoice Date : ",
                    style: pw.TextStyle(
                        fontSize: 12,
                        fontWeight: pw.FontWeight.bold,
                        // fontFamily: 'task',
                        // letterSpacing: 1,
                        color: PdfColors.black),
                  ),
                ],
              ),
              pw.Text(
                  invoicedetailmodal?.invoiceData?.dueDate ==
                      '' ||
                      invoicedetailmodal
                          ?.invoiceData?.dueDate ==
                          null
                      ? 'N/A'
                      : invoicedetailmodal
                      ?.invoiceData?.dueDate ??
                      '',
                  style: pw.TextStyle(
                      color: PdfColors.black,
                      fontSize: 12,
                      fontWeight: pw.FontWeight.normal,
                      // fontFamily: "task")
                    ),
              ),
            ],
          ),

          pw.SizedBox(
            height: 7
          ),

          pw.Row(
            // mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Row(
                children: [
                  pw.Text(
                    "Invoice Number : ",
                    style: pw.TextStyle(
                        fontSize: 12,
                        fontWeight: pw.FontWeight.bold,
                        // fontFamily: 'task',
                        // letterSpacing: 1,
                        color: PdfColors.black),
                  ),
                ],
              ),
              pw.Text(
                invoicedetailmodal?.invoiceData
                    ?.invoiceNumber ==
                    '' ||
                    invoicedetailmodal?.invoiceData
                        ?.invoiceNumber ==
                        null
                    ? 'N/A'
                    : invoicedetailmodal?.invoiceData
                    ?.invoiceNumber ??
                    '',
                style: pw.TextStyle(
                    fontSize: 12,
                    // fontFamily: 'task',
                    color:  PdfColors.black,
                  fontWeight: pw.FontWeight.normal,
                ),
              ),
            ],
          ),

          pw.SizedBox(
            height: 7,
          ),

          pw.Container(
            decoration: pw.BoxDecoration(
              borderRadius: pw.BorderRadius.circular(30),
              color:  PdfColors.white,
            ),
            child: pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  "Task Title : ",
                  style: pw.TextStyle(
                      fontSize: 12,
                      fontWeight: pw.FontWeight.bold,
                      // fontFamily: 'task',
                      // letterSpacing: 2,
                      color:  PdfColors.black),
                ),
                pw.Expanded(
                  child:  pw.Container(
                    // padding: pw.EdgeInsets.only(left: 0.5.h),
                    child: pw.Text(
                      invoicedetailmodal?.invoiceData
                          ?.taskName ==
                          '' ||
                          invoicedetailmodal?.invoiceData
                              ?.taskName ==
                              null
                          ? 'N/A'
                          : invoicedetailmodal
                          ?.invoiceData?.taskName ??
                          '',
                      style: pw.TextStyle(
                          fontSize: 12,
                          // fontFamily: 'task',
                          color: PdfColors.black
                      ),
                    ),
                  ),
                )

              ],
            ),
          ),
          pw.SizedBox(
            height: 7
          ),

          pw.Container(
            decoration: pw.BoxDecoration(
              borderRadius: pw.BorderRadius.circular(30),
              color:  PdfColors.white,
            ),
            // margin: pw.EdgeInsets.symmetric(horizontal: 15),
            child: pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              // mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  "About Task : ",
                  style: pw.TextStyle(
                      fontSize: 12,
                      fontWeight: pw.FontWeight.bold,
                      // fontFamily: 'task',
                      // letterSpacing: 2,
                      color: PdfColors.black),
                ),
                pw.Expanded(child:
                pw.Container(
                  // padding: pw.EdgeInsets.only(right: 2.h),
                  child: pw.Text(
                    invoicedetailmodal?.invoiceData
                        ?.taskDescription ==
                        '' ||
                        invoicedetailmodal?.invoiceData
                            ?.taskDescription ==
                            null
                        ? 'N/A'
                        : invoicedetailmodal?.invoiceData
                        ?.taskDescription ??
                        '',
                    style: pw.TextStyle(
                        fontSize:12,
                        // fontFamily: 'task',
                        color: PdfColors.black),
                  ),
                ),
                )

              ],
            ),
          ),
          pw.SizedBox(
            height:7
          ),
          pw.Container(
            decoration: pw.BoxDecoration(
              borderRadius: pw.BorderRadius.circular(30),
              color:  PdfColors.white,
            ),
            child: pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,

              children: [
                pw.Text(
                  "Status : ",
                  style: pw.TextStyle(
                      fontSize: 12,
                      fontWeight: pw.FontWeight.bold,
                      // fontFamily: 'task',
                      // letterSpacing: 2,
                      color:  PdfColors.black),
                ),
                pw.Expanded(
                  child: pw.Container(
                    // padding: pw.EdgeInsets.only(left: 0.5.h),
                    child:  pw.Text(
                      invoicedetailmodal
                          ?.invoiceData?.status ==
                          '1'
                          ? "Paid"
                          : "Unpaid",
                      style: pw.TextStyle(
                        fontSize: 12,
                        // fontFamily: 'task',
                        fontWeight: pw.FontWeight.bold,
                        color: invoicedetailmodal
                            ?.invoiceData?.status ==
                            '1'
                            ? PdfColors.green200
                            : PdfColors.red200,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

                pw.SizedBox(
                  height: 20
                ),
          invoicedetailmodal?.invoiceData?.taskType == '1'?
          pw.Table(
          border: pw.TableBorder.all(),
            defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
            columnWidths:{0: pw.FractionColumnWidth(.5),1: pw.FractionColumnWidth(.5),2: pw.FractionColumnWidth(.5),},
          children: [
            pw.TableRow(

                decoration: pw.BoxDecoration(
              color: PdfColors.blue200
            ),
              children:[
                pw.Container(
                  alignment: pw.Alignment.center,
                  height: 32,
                  child:    pw.Text("Total Hours",
                      textAlign: pw.TextAlign.center,
                      style: pw.TextStyle(
                          fontSize: 12, fontWeight: pw.FontWeight.bold)),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                    height: 32,
                child:     pw.Text("Amount",
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(
                        fontSize:12, fontWeight: pw.FontWeight.bold)),
                ),

                pw.Container(
                  alignment: pw.Alignment.center,
                    height: 32,
                child:   pw.Text("Total Amount",
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(
                        fontSize: 12, fontWeight: pw.FontWeight.bold)),
                )



              ]
            ),
            pw.TableRow(

                decoration: pw.BoxDecoration(
                    color: PdfColors.white

                ),
                children: [
                  pw.Container(
                    alignment: pw.Alignment.center,
                      height: 32,
              child:  pw.Text(
                invoicedetailmodal?.invoiceData
                    ?.totalTime ==
                    '' ||
                    invoicedetailmodal
                        ?.invoiceData
                        ?.totalTime ==
                        null
                    ? 'N/A'
                    : (invoicedetailmodal
                    ?.invoiceData
                    ?.totalTime)
                    .toString() +
                    ' Hour',
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.normal,
                  fontSize: 12,
                  // fontFamily: "task"
                ),
              ),
                  ),

                  pw.Container(
                    alignment: pw.Alignment.center,
                      height: 32,
                  child:  pw.Text(
                    invoicedetailmodal?.invoiceData
                        ?.taskAmount ==
                        '' ||
                        invoicedetailmodal
                            ?.invoiceData
                            ?.taskAmount ==
                            null
                        ? 'N/A'
                        : '\$ ' +
                        (invoicedetailmodal
                            ?.invoiceData
                            ?.taskAmount)
                            .toString() +
                        '/h',
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.normal,
                      fontSize: 12,
                      // pw.fontFamily: "task"
                    ),), ),

                  pw.Container(
                    alignment: pw.Alignment.center,
                      height: 32,
                      child: pw.Text(
                      '\$ ' + (invoicedetailmodal
                            ?.invoiceData
                            ?.totalAmount ==
                            null ||
                            invoicedetailmodal
                                ?.invoiceData
                                ?.totalAmount ==
                                ""
                            ? "N/A"
                            : (invoicedetailmodal
                            ?.invoiceData
                            ?.totalAmount)
                            .toString())
                           ,
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(
                            fontSize: 12,
                            // fontFamily: "task",
                            fontWeight:
                            pw.FontWeight.normal),
                      ), )

            ]),

          ]
        ):  pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [
              pw.SizedBox(
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Text("Total Amount : ",
                        style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.normal)),
                    pw.Text(
                      '\$ ' +
                          (invoicedetailmodal
                              ?.invoiceData
                              ?.taskAmount)
                              .toString(),
                      style: pw.TextStyle(
                          fontSize: 12,
                          // fontFamily: "task",
                          fontWeight:
                          pw.FontWeight.bold),),
                  ],
                ),
              ),
            ],
          ),
          pw.SizedBox(
            height: 20,
          ),

    //       pw.Column(
    //         mainAxisAlignment: pw.MainAxisAlignment.start,
    //         children: [
    //           pw.Row(
    //             mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
    // //             children: [
    // //               pw.Text(
    // //       invoicedetailmodal?.invoiceData
    // //           ?.totalTime ==
    // //       '' ||
    // //       invoicedetailmodal
    // //           ?.invoiceData
    // //           ?.totalTime ==
    // //           null
    // //           ? 'N/A'
    // //               : (invoicedetailmodal
    // //               ?.invoiceData
    // //           ?.totalTime)
    // //           .toString() +
    // //           ' Hour',
    // //   style: pw.TextStyle(
    // //       fontWeight: pw.FontWeight.normal,
    // //       fontSize: 19.sp,
    // //       // fontFamily: "task"
    // //     ),
    // // ),
    // //
    // //               pw.Text(
    // //                 invoicedetailmodal?.invoiceData
    // //                     ?.taskAmount ==
    // //                     '' ||
    // //                     invoicedetailmodal
    // //                         ?.invoiceData
    // //                         ?.taskAmount ==
    // //                         null
    // //                     ? 'N/A'
    // //                     : '\$ ' +
    // //                     (invoicedetailmodal
    // //                         ?.invoiceData
    // //                         ?.taskAmount)
    // //                         .toString() +
    // //                     '/h',
    // //                 style: pw.TextStyle(
    // //                     fontWeight: pw.FontWeight.normal,
    // //                     fontSize: 19.sp,
    // //                     // pw.fontFamily: "task"
    // //                 ),),
    // //
    // //               pw.Text(
    // //                 invoicedetailmodal
    // //                     ?.invoiceData
    // //                     ?.totalTime ==
    // //                     null ||
    // //                     invoicedetailmodal
    // //                         ?.invoiceData
    // //                         ?.totalTime ==
    // //                         ""
    // //                     ? "N/A"
    // //                     : (invoicedetailmodal
    // //                     ?.invoiceData
    // //                     ?.totalTime)
    // //                     .toString() +
    // //                     " Hour",
    // //                 style: pw.TextStyle(
    // //                     fontSize: 19.sp,
    // //                     // fontFamily: "task",
    // //                     fontWeight:
    // //                     pw.FontWeight.normal),
    // //               ),
    // //
    // //             ],
    //           ),
    //         ],
    //       ),
    //       pw.SizedBox(
    //         height: 1.h,
    //       ),
    //       pw.Divider(
    //         color: PdfColors.black,
    //         height: 20,
    //         thickness: 1.3,
    //       ),
    //       pw.SizedBox(
    //         height: 5
    //       ),

          invoicedetailmodal?.invoiceData?.taskType == '1'?  pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              pw.SizedBox(
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.end,
                  children: [
                    pw.Text("Total Amount : ",
                        style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.normal)),
                    pw.Text(
                      '\$ ' +
                          (invoicedetailmodal
                              ?.invoiceData
                              ?.totalAmount)
                              .toString(),
                      style: pw.TextStyle(
                          fontSize: 12,
                          // fontFamily: "task",
                          fontWeight:
                          pw.FontWeight.bold),),
                  ],
                ),
              ),
            ],
          ):pw.Container(),
          pw.SizedBox(
            height: 70
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Text(
                  "Thank You !",
                  style: pw.TextStyle(
                      fontSize: 20,
                      fontWeight:
                      pw.FontWeight.bold
                  )
              ),
            ]
          )

        ],
      ),
    );
    pdf.addPage(pw.Page(
      // pageFormat: PdfPageFormat(pageWidth, pageHeight),
      build: (pw.Context context) => pdfWidget,
    ));
    const downloadsFolderPath = '/storage/emulated/0/Download';

    Directory dir = Directory(downloadsFolderPath);
      // Directory dir =  await getApplicationDocumentsDirectory();
    final String filePath = '${dir?.path}/Invoice.pdf';

    final File file = File(filePath!);
    try {
      await file.writeAsBytes(await pdf.save());
      print(filePath);

        EasyLoading.showSuccess(
            'Pdf Downloaded');

    } catch (e) {}
  }

    Future<pw.Font> yourFont() async {
    final fontData = await rootBundle
        .load('assets/fonts/.ttf'); // Replace with your font file path
    final fontUint8List = fontData.buffer.asUint8List();
    final fontByteData = ByteData.sublistView(fontUint8List);
    final font = pw.Font.ttf(fontByteData);
    return font;
  }

    Future<pw.MemoryImage> loadImageFromAsset(String assetPath) async {
    final ByteData data = await rootBundle.load(assetPath);
    final Uint8List bytes = data.buffer.asUint8List();
    return pw.MemoryImage(Uint8List.fromList(bytes));
  }

    Future<List<int>> fetchImage(String imageUrl) async {
    var http;
    final response = await http.get(Uri.parse(imageUrl));
    return response.bodyBytes;
  }




}
