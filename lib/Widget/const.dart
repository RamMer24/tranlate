


import 'package:connectivity/connectivity.dart';
import 'package:tranlate/Modals/ChatListModal2.dart';
import 'package:tranlate/Modals/ChatViewModal.dart';
import 'package:tranlate/Modals/ForgotPasswordModal.dart';
import 'package:tranlate/Modals/LoginModal.dart';
import 'package:tranlate/Modals/MessSendModal.dart';
import 'package:tranlate/Modals/UpdateProfileModal.dart';
import 'package:tranlate/Modals/ViewProfileModal.dart';
import '../Modals/AddCommentModal.dart';
import '../Modals/ChangepasswordModal.dart';
import '../Modals/ChatListModal.dart';
import '../Modals/CommentTaskModal.dart';
import '../Modals/InvoiceDetailModal.dart';
import '../Modals/InvoiceListModal.dart';
import '../Modals/InvoicePaidModal.dart';
import '../Modals/InvoiceUnpaidModal.dart';
import '../Modals/SearchListModal.dart';
import '../Modals/TaskListDetailModal.dart';
import '../Modals/TaskListModal.dart';

const String baseUrl = 'https://translation.fableadtechnolabs.com/API';


UserModal? usermodal;
ChangepasswordModal?changeModal;
ViewProfileModal?viewProfileModal;
UpdateProfileModal?updateprofilemodal;
ForgotPasswordModal?forgotpasswordmodal;
TaskListModal?tasklistmodal;
InvoiceListModal?invoicelistmodal;
InvoiceUnpaidModal?invoiceunpaidmodal;
InvoicePaidModal?invoicepaidmodal;
TaskListDetailModal?tasklistdetailmodal;
InvoiceDetailModal?invoicedetailmodal;
CommentTaskModal?commenttaskmodal;
AddCommentModal?addcommentmodal;
ChatListModal?chatlistmodal;
SearchListModal?searchlistmodal;
ChatViewModal?chatviewmodal;
MessSendModal?messsendmodal;
ChatListModal2?chatlistmodal2;




Future<bool> checkInternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}

