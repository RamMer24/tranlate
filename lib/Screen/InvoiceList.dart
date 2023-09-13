import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tranlate/Modals/InvoiceListModal.dart';
import 'package:tranlate/Modals/InvoicePaidModal.dart';
import 'package:tranlate/Modals/InvoiceUnpaidModal.dart';
import 'package:tranlate/Provider/authprovider.dart';
import 'package:tranlate/Screen/InvoiceDetail.dart';
import 'package:tranlate/Widget/bottombar.dart';
import 'package:tranlate/Widget/buildErrorDialog.dart';
import 'package:tranlate/Widget/const.dart';
import 'package:tranlate/Widget/drawer.dart';
import 'package:tranlate/Widget/loader.dart';


class InvoiceList extends StatefulWidget {
  const InvoiceList({super.key});

  @override
  State<InvoiceList> createState() => _InvoiceListState();
}

int selected = 1;
int sel = 1;

class _InvoiceListState extends State<InvoiceList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      sel= 1;
    });
    InvoiceListAPI();
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        key: _scaffoldKey,
        drawer: drawer1(),
        bottomNavigationBar: bottombar(),
        body: SingleChildScrollView(
          child: isLoading
              ? Container()
              : Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                  child: Column(
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
                              "Invoice List",
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
                        height: 1.5.h,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 8.h,
                        width: double.infinity,
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 3.2.w),
                          scrollDirection: Axis.horizontal,
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      sel = 1;
                                      isLoading = true;
                                      InvoiceListAPI();
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 27.w,
                                    height: 5.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: sel == 1
                                          ? Color(0xff0165FF)
                                          : Color(0xfffefefe),
                                    ),
                                    child: Text(
                                      "All",
                                      style: TextStyle(
                                        fontFamily: "task",
                                        fontSize: 15.sp,
                                        color: sel == 1
                                            ? Color(0xfffefefe)
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      sel = 2;
                                      isLoading = true;
                                      InvoiceUnpaidApi();
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 27.w,
                                    height: 5.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: sel == 2
                                          ? Color(0xff0165FF)
                                          : Color(0xfffefefe),
                                    ),
                                    child: Text(
                                      "Unpaid",
                                      style: TextStyle(
                                          fontFamily: "task",
                                          fontSize: 15.sp,
                                          color: sel == 2
                                              ? Color(0xfffefefe)
                                              : Colors.black,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      sel = 3;
                                      isLoading = true;
                                      InvoicePaidApi();
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 27.w,
                                    height: 5.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: sel == 3
                                          ? Color(0xff0165FF)
                                          : Color(0xfffefefe),
                                    ),
                                    child: Text(
                                      "Paid",
                                      style: TextStyle(
                                          fontFamily: "task",
                                          fontSize: 15.sp,
                                          color: sel == 3
                                              ? Color(0xfffefefe)
                                              : Colors.black,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      sel == 1
                          ? invoicelistmodal?.invoiceData?.length == 0 ||
                                  invoicelistmodal?.invoiceData?.length == null
                              ? Container(
                          height: 65.h,
                          alignment: Alignment.center,
                          child: Text(
                            "No Invoice Available",
                            style: TextStyle(
                                fontFamily: "task",
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                                color: Colors.black),
                          ))
                              : Column(
                                  children: [
                                    Container(
                                      height: 85.h,
                                      child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        itemCount: invoicelistmodal
                                            ?.invoiceData?.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder:
                                                          (context) =>
                                                              InvoiceDetail(
                                                                ispaid: invoicelistmodal
                                                                            ?.invoiceData?[index]
                                                                            .status ==
                                                                        '1'
                                                                    ? 1
                                                                    : 2,
                                                                id: invoicelistmodal
                                                                        ?.invoiceData?[
                                                                            index]
                                                                        .invId ??
                                                                    "",
                                                              )));
                                            },
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 3.h,
                                                      horizontal: 3.w),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Color(0xfffefefe),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          SizedBox(
                                                            width: 60.w,
                                                            child: Text(
                                                              maxLines: 1,
                                                              overflow: TextOverflow.ellipsis,
                                                              invoicelistmodal
                                                                              ?.invoiceData?[
                                                                                  index]
                                                                              .taskName ==
                                                                          '' ||
                                                                      invoicelistmodal
                                                                              ?.invoiceData?[
                                                                                  index]
                                                                              .taskName ==
                                                                          null
                                                                  ? 'N/A'
                                                                  : invoicelistmodal
                                                                          ?.invoiceData?[
                                                                              index]
                                                                          .taskName ??
                                                                      '',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 15.sp,
                                                                  fontFamily:
                                                                      "task"),
                                                            ),
                                                          ),
                                                          Text(
                                                            invoicelistmodal
                                                                            ?.invoiceData?[
                                                                                index]
                                                                            .amount ==
                                                                        '' ||
                                                                    invoicelistmodal
                                                                            ?.invoiceData?[
                                                                                index]
                                                                            .amount ==
                                                                        null
                                                                ? 'N/A'
                                                                : '\$ ' +
                                                                    (invoicelistmodal
                                                                            ?.invoiceData?[index]
                                                                            .amount)
                                                                        .toString(),
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 15.sp,
                                                                fontFamily:
                                                                    "task"),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                invoicelistmodal?.invoiceData?[index].startDate ==
                                                                            '' ||
                                                                        invoicelistmodal?.invoiceData?[index].startDate ==
                                                                            null
                                                                    ? 'N/A'
                                                                    : invoicelistmodal
                                                                            ?.invoiceData?[index]
                                                                            .startDate ??
                                                                        '',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        11.sp,
                                                                    fontFamily:
                                                                        "task"),
                                                              ),
                                                              SizedBox(
                                                                width: 1.h,
                                                              ),
                                                              Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                width: 15.w,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                  color: invoicelistmodal
                                                                              ?.invoiceData?[
                                                                                  index]
                                                                              .status ==
                                                                          '1'
                                                                      ? Colors
                                                                          .green
                                                                          .shade200
                                                                      : Colors
                                                                          .grey
                                                                          .shade200,
                                                                ),
                                                                child: Text(
                                                                  "Paid",
                                                                  style: TextStyle(
                                                                      color: invoicelistmodal?.invoiceData?[index].status ==
                                                                              '1'
                                                                          ? Colors
                                                                              .green
                                                                          : Colors
                                                                              .grey,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          "task"),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 0.5.h,
                                                              ),
                                                              Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                width: 15.w,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                  color: invoicelistmodal
                                                                              ?.invoiceData?[
                                                                                  index]
                                                                              .status ==
                                                                          '2'
                                                                      ? Colors
                                                                          .red
                                                                          .shade100
                                                                      : Colors
                                                                          .grey
                                                                          .shade200,
                                                                ),
                                                                child: Text(
                                                                  "Unpaid",
                                                                  style: TextStyle(
                                                                      color: invoicelistmodal?.invoiceData?[index].status ==
                                                                              '2'
                                                                          ? Colors
                                                                              .red
                                                                          : Colors
                                                                              .grey,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          "task"),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                invoicelistmodal
                                                                            ?.invoiceData?[
                                                                                index]
                                                                            .status ==
                                                                        '1'
                                                                    ? (invoicelistmodal?.invoiceData?[index].leftDays)
                                                                            .toString() +
                                                                        " days ago"
                                                                    : (invoicelistmodal?.invoiceData?[index].leftDays)
                                                                            .toString() +
                                                                        ' days left ',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12.sp,
                                                                    color: invoicelistmodal?.invoiceData?[index].status == '1'
                                                                        ? Colors
                                                                            .green
                                                                        : Colors
                                                                            .red
                                                                            .shade100,
                                                                    fontFamily:
                                                                        "task"),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Divider(
                                                  color: Colors.grey,
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                )
                          : sel == 2
                              ? invoiceunpaidmodal?.invoiceData?.length == 0 ||
                                      invoiceunpaidmodal?.invoiceData?.length ==
                                          null
                                  ? Container(
                          height: 65.h,
                          alignment: Alignment.center,
                          child: Text(
                            "No Invoice Available",
                            style: TextStyle(
                                fontFamily: "task",
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                                color: Colors.black),
                          ))
                                  : Column(
                                      children: [
                                        Container(
                                          height: 85.h,
                                          child: ListView.builder(
                                            itemCount: invoiceunpaidmodal
                                                ?.invoiceData?.length,
                                            padding: EdgeInsets.zero,
                                            itemBuilder: (context, index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) => InvoiceDetail(
                                                              ispaid: 2,
                                                              id: invoicelistmodal
                                                                      ?.invoiceData?[
                                                                          index]
                                                                      .invId ??
                                                                  "")));
                                                },
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 3.h,
                                                              horizontal: 3.w),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color:
                                                            Color(0xfffefefe),
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              SizedBox(
                                                                width: 60.w,
                                                                child: Text(
                                                                  maxLines: 1,
                                                                  overflow: TextOverflow.ellipsis,
                                                                  invoicelistmodal?.invoiceData?[index].taskName ==
                                                                              '' ||
                                                                          invoicelistmodal?.invoiceData?[index].taskName ==
                                                                              null
                                                                      ? 'N/A'
                                                                      : invoiceunpaidmodal
                                                                              ?.invoiceData?[index]
                                                                              .taskName ??
                                                                          '',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          15.sp,
                                                                      fontFamily:
                                                                          "task"),
                                                                ),
                                                              ),
                                                              Text(
                                                                invoicelistmodal?.invoiceData?[index].amount ==
                                                                            '' ||
                                                                        invoicelistmodal?.invoiceData?[index].amount ==
                                                                            null
                                                                    ? 'N/A'
                                                                    : '\$ ' +
                                                                        (invoiceunpaidmodal?.invoiceData?[index].amount)
                                                                            .toString(),
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        15.sp,
                                                                    fontFamily:
                                                                        "task"),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              SizedBox(
                                                                width: 40.w,
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      invoicelistmodal?.invoiceData?[index].startDate == '' ||
                                                                              invoicelistmodal?.invoiceData?[index].startDate ==
                                                                                  null
                                                                          ? 'N/A'
                                                                          : invoiceunpaidmodal?.invoiceData?[index].startDate ??
                                                                              '',
                                                                      style: TextStyle(
                                                                          fontSize: 11
                                                                              .sp,
                                                                          fontFamily:
                                                                              "task"),
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                          1.h,
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                          0.5.h,
                                                                    ),
                                                                    Container(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      width:
                                                                          15.w,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                        color: Colors
                                                                            .red
                                                                            .shade100,
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        "Unpaid",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.red,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontFamily: "task"),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    (invoiceunpaidmodal?.invoiceData?[index].leftDays)
                                                                            .toString() +
                                                                        " days left",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .red
                                                                          .shade100,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Divider(
                                                      color: Colors.grey,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    )
                              : invoicepaidmodal?.invoiceData?.length == 0 ||
                                      invoicepaidmodal?.invoiceData?.length ==
                                          null
                                  ? Container(
                                      height: 65.h,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "No Invoice Available",
                                        style: TextStyle(
                                            fontFamily: "task",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.sp,
                                            color: Colors.black),
                                      ))
                                  : Column(
                                      children: [
                                        Container(
                                          height: 85.h,
                                          child: ListView.builder(
                                            itemCount: invoicepaidmodal
                                                ?.invoiceData?.length,
                                            padding: EdgeInsets.zero,
                                            itemBuilder: (context, index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) => InvoiceDetail(
                                                              ispaid: 1,
                                                              id: invoicelistmodal
                                                                      ?.invoiceData?[
                                                                          index]
                                                                      .invId ??
                                                                  "")));
                                                },
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 3.h,
                                                              horizontal: 3.w),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color:
                                                            Color(0xfffefefe),
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              SizedBox(
                                                                width: 60.w,
                                                                child: Text(
                                                                  maxLines: 1,
                                                                  overflow: TextOverflow.ellipsis,
                                                                  invoicelistmodal?.invoiceData?[index].taskName ==
                                                                              '' ||
                                                                          invoicelistmodal?.invoiceData?[index].taskName ==
                                                                              null
                                                                      ? 'N/A'
                                                                      : invoicepaidmodal
                                                                              ?.invoiceData?[index]
                                                                              .taskName ??
                                                                          '',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          15.sp,
                                                                      fontFamily:
                                                                          "task"),
                                                                ),
                                                              ),
                                                              Text(
                                                                invoicelistmodal?.invoiceData?[index].amount ==
                                                                            '' ||
                                                                        invoicelistmodal?.invoiceData?[index].amount ==
                                                                            null
                                                                    ? 'N/A'
                                                                    : '\$ ' +
                                                                        (invoicepaidmodal?.invoiceData?[index].amount)
                                                                            .toString(),
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        15.sp,
                                                                    fontFamily:
                                                                        "task"),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    invoicelistmodal?.invoiceData?[index].startDate ==
                                                                                '' ||
                                                                            invoicelistmodal?.invoiceData?[index].startDate ==
                                                                                null
                                                                        ? 'N/A'
                                                                        : invoicepaidmodal?.invoiceData?[index].startDate ??
                                                                            '',
                                                                    style: TextStyle(
                                                                        fontSize: 11
                                                                            .sp,
                                                                        fontFamily:
                                                                            "task"),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 1.h,
                                                                  ),
                                                                  Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    width: 15.w,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                      color: Colors
                                                                          .green
                                                                          .shade200,
                                                                    ),
                                                                    child: Text(
                                                                      "Paid",
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .green,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontFamily:
                                                                            "Profile",
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    (invoicepaidmodal?.invoiceData?[index].leftDays)
                                                                            .toString() +
                                                                        " days ago",
                                                                    style: TextStyle(
                                                                        fontSize: 12
                                                                            .sp,
                                                                        fontFamily:
                                                                            "task",
                                                                        color: Colors
                                                                            .green),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Divider(
                                                      color: Colors.grey,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }


  InvoiceListAPI() async {
    final Map<String, String> data = {};
    data['client_id'] = usermodal?.userData?.uid ?? "";
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().InvoiceListAPI(data).then((response) async {
          invoicelistmodal =
              InvoiceListModal.fromJson(json.decode(response.body));
          print(invoicelistmodal?.status);
          if (response.statusCode == 200 &&
              invoicelistmodal?.status == "success") {

            // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MainPage()));
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


  InvoiceUnpaidApi() async {
    final Map<String, String> data = {};
    data['client_id'] = usermodal?.userData?.uid ?? "";
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().InvoiceUnpaidApi(data).then((response) async {
          invoiceunpaidmodal =
              InvoiceUnpaidModal.fromJson(json.decode(response.body));
          print(invoiceunpaidmodal?.status);
          if (response.statusCode == 200 &&
              invoiceunpaidmodal?.status == "success") {

            // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MainPage()));
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

  InvoicePaidApi() async {
    final Map<String, String> data = {};
    data['client_id'] = usermodal?.userData?.uid ?? "";
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().InvoicePaidApi(data).then((response) async {
          invoicepaidmodal =
              InvoicePaidModal.fromJson(json.decode(response.body));
          print(invoicelistmodal?.status);
          if (response.statusCode == 200 &&
              invoicepaidmodal?.status == "success") {
            print('EE Thay Gyu Hooooo ! ^_^');
            // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MainPage()));
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
