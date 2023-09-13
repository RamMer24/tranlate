import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:tranlate/Widget/CustomExpection.dart';

import '../Widget/const.dart';
import '../Widget/response.dart';

class authprovider with ChangeNotifier {
  Map<String, String> headers = {
    'Authorization': 'hXuRUGsEGuhGf6KG',
  };
  Future<http.Response> loginapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/login_client";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> ChangePassword(Map<String, String> bodyData) async {
    const url = "$baseUrl/change_client_password";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> ViewProfile(Map<String, String> bodyData) async {
    const url = "$baseUrl/view_client_profile";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> profileupdateapi(Map<String, String> bodyData) async {
    const url =
        'https://translation.fableadtechnolabs.com/API/edit_client_profile';
    var responseJson;
    if (bodyData['profile_img'] != "") {
      print("hiii");
      try {
        final imageUploadRequest =
            http.MultipartRequest('POST', Uri.parse(url));
        imageUploadRequest.headers.addAll(headers);
        if (bodyData['profile_img']?.isNotEmpty ?? false) {
          final file = await http.MultipartFile.fromPath(
              'profile_img', bodyData['profile_img'] ?? '');
          imageUploadRequest.files.add(file);
        }
        imageUploadRequest.fields.addAll(bodyData);
        print(imageUploadRequest.files);
        final streamResponse = await imageUploadRequest.send();
        print(streamResponse.statusCode);
        responseJson =
            responses(await http.Response.fromStream(streamResponse));
        print(responseJson);
      } on SocketException {
        throw FetchDataException('No Internet connection');
      }
      return responseJson;
    } else {
      print("a helllooo");
      final response = await http
          .post(Uri.parse(url), body: bodyData, headers: headers)
          .timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw const SocketException('Something went wrong');
        },
      );
      print(response.statusCode);
      responseJson = responses(response);
      print(responseJson);
      return responseJson;
    }
  }

  Future<http.Response> forgotapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/forgot_password_app";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> TaskListapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/get_task_by_client_id";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> InvoiceListAPI(Map<String, String> bodyData) async {
    const url = "$baseUrl/get_invoice_details";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> InvoiceUnpaidApi(Map<String, String> bodyData) async {
    const url = "$baseUrl/get_invoice_unpaid";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> InvoicePaidApi(Map<String, String> bodyData) async {
    const url = "$baseUrl/get_invoice_paid";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }




                    // chat list auth provider 1

  // Future<http.Response> ChatListApi(Map<String, String> bodyData) async {
  //   const url = "$baseUrl/message_list";
  //   var responseJson;
  //   final response = await http
  //       .post(Uri.parse(url), body: bodyData, headers: headers)
  //       .timeout(
  //     const Duration(seconds: 30),
  //     onTimeout: () {
  //       throw const SocketException('Something went wrong');
  //     },
  //   );
  //   responseJson = responses(response);
  //   return responseJson;
  // }

  //      chat list auth provider 2

  Future<http.Response> ChatListApi2(Map<String, String> bodyData) async {
    const url = "$baseUrl/admin_chat_list";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }


  Future<http.Response> TaskListDetailModal(Map<String, String> bodyData) async {
    const url = "$baseUrl/get_task_info";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> invoicapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/get_invoice_by_inv_id";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

   Future<http.Response> commenttaskapi(Map<String, String> bodyData) async {
     const url = "$baseUrl/get_task_comment";
     var responseJson;
     final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
       const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> addcommentapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/add_comment";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> Serchapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/search_by_name";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> chatviewap(Map<String, String> bodyData) async {
    const url = "$baseUrl/msg_conversation";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> messsendap(Map<String, String> bodyData) async {
    const url = '$baseUrl/send_message';
    var responseJson;
    if (bodyData['type'] == "1") {
      final response = await http
          .post(Uri.parse(url), body: bodyData, headers: headers)
          .timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw const SocketException('Something went wrong');
        },
      );
      responseJson = responses(response);
      return responseJson;
    } else {
      try {
        final imageUploadRequest =
            http.MultipartRequest('POST', Uri.parse(url));
        imageUploadRequest.headers.addAll(headers);
        if (bodyData['message']?.isNotEmpty ?? false) {
          var file = await http.MultipartFile.fromPath(
            'message',
            bodyData['message'] ?? '',
            contentType: bodyData['type'] == "2"
                ? MediaType('image', 'jpg,png')
                : MediaType('video', 'mp4'),
          );

          imageUploadRequest.files.add(file);
        }

        imageUploadRequest.fields.addAll(bodyData);
        final streamResponse = await imageUploadRequest.send();

        responseJson =
            responses(await http.Response.fromStream(streamResponse));
      } on SocketException {
        throw FetchDataException('No Internet connection');
      }
      return responseJson;
    }
  }
}
