class SearchListModal {
  String? message;
  String? status;
  List<AllChat>? allChat;

  SearchListModal({this.message, this.status, this.allChat});

  SearchListModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['all_chat'] != null) {
      allChat = <AllChat>[];
      json['all_chat'].forEach((v) {
        allChat!.add(new AllChat.fromJson(v));
      });
    }
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.allChat != null) {
      data['all_chat'] = this.allChat!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllChat {
  String? chatId;
  String? fromUserId;
  String? toUserId;
  String? messageType;
  String? messages;
  String? status;
  String? createdDate;
  String? updatedDate;
  String? uid;
  String? userName;
  String? userRole;
  String? email;
  String? password;
  String? profileImg;
  String? gender;
  String? mobile;
  String? address;
  String? forgotPassKey;
  String? reciverid;
  String? ruserName;
  String? time;



  AllChat(
      {
        this.chatId,
        this.fromUserId,
        this.toUserId,
        this.messageType,
        this.messages,
        this.status,
        this.createdDate,
        this.updatedDate,
        this.uid,
        this.userName,
        this.userRole,
        this.email,
        this.password,
        this.profileImg,
        this.gender,
        this.mobile,
        this.address,
        this.forgotPassKey,
        this.reciverid,
        this.ruserName,
        this.time});



  AllChat.fromJson(Map<String, dynamic> json) {
    chatId = json['chat_id'];
    fromUserId = json['from_user_id'];
    toUserId = json['to_user_id'];
    messageType = json['message_type'];
    messages = json['messages'];
    status = json['status'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
    uid = json['uid'];
    userName = json['user_name'];
    userRole = json['user_role'];
    email = json['email'];
    password = json['password'];
    profileImg = json['profile_img'];
    gender = json['gender'];
    mobile = json['mobile'];
    address = json['address'];
    forgotPassKey = json['forgot_pass_key'];
    reciverid = json['reciverid'];
    ruserName = json['ruser_name'];
    time = json['time'];
  }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chat_id'] = this.chatId;
    data['from_user_id'] = this.fromUserId;
    data['to_user_id'] = this.toUserId;
    data['message_type'] = this.messageType;
    data['messages'] = this.messages;
    data['status'] = this.status;
    data['created_date'] = this.createdDate;
    data['updated_date'] = this.updatedDate;
    data['uid'] = this.uid;
    data['user_name'] = this.userName;
    data['user_role'] = this.userRole;
    data['email'] = this.email;
    data['password'] = this.password;
    data['profile_img'] = this.profileImg;
    data['gender'] = this.gender;
    data['mobile'] = this.mobile;
    data['address'] = this.address;
    data['forgot_pass_key'] = this.forgotPassKey;
    data['reciverid'] = this.reciverid;
    data['ruser_name'] = this.ruserName;
    data['time'] = this.time;
    return data;
  }
}
