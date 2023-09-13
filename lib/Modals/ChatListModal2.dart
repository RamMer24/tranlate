class ChatListModal2 {
  String? status;
  AdminData? adminData;

  ChatListModal2({this.status, this.adminData});

  ChatListModal2.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    adminData = json['admin_data'] != null
        ? new AdminData.fromJson(json['admin_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.adminData != null) {
      data['admin_data'] = this.adminData!.toJson();
    }
    return data;
  }
}

class AdminData {
  String? uid;
  String? userName;
  String? userRole;
  String? email;
  String? password;
  String? profileImg;
  String? gender;
  String? mobile;
  String? address;
  Null? forgotPassKey;
  String? createdDate;
  String? updatedDate;
  String? messageType;
  String? fromUserId;
  String? fromUserName;
  String? toUserId;
  String? toUserName;
  String? time;
  String? msg;

  AdminData(
      {this.uid,
        this.userName,
        this.userRole,
        this.email,
        this.password,
        this.profileImg,
        this.gender,
        this.mobile,
        this.address,
        this.forgotPassKey,
        this.createdDate,
        this.updatedDate,
        this.messageType,
        this.fromUserId,
        this.fromUserName,
        this.toUserId,
        this.toUserName,
        this.time,
        this.msg});

  AdminData.fromJson(Map<String, dynamic> json) {
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
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
    messageType = json['message_type'];
    fromUserId = json['from_user_id'];
    fromUserName = json['from_user_name'];
    toUserId = json['to_user_id'];
    toUserName = json['to_user_name'];
    time = json['time'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['created_date'] = this.createdDate;
    data['updated_date'] = this.updatedDate;
    data['message_type'] = this.messageType;
    data['from_user_id'] = this.fromUserId;
    data['from_user_name'] = this.fromUserName;
    data['to_user_id'] = this.toUserId;
    data['to_user_name'] = this.toUserName;
    data['time'] = this.time;
    data['msg'] = this.msg;
    return data;
  }
}
