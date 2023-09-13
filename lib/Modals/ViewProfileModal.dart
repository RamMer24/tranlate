class ViewProfileModal {
  String? message;
  String? status;
  ClientData? clientData;

  ViewProfileModal({this.message, this.status, this.clientData});

  ViewProfileModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    clientData = json['client_data'] != null
        ? new ClientData.fromJson(json['client_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.clientData != null) {
      data['client_data'] = this.clientData!.toJson();
    }
    return data;
  }
}

class ClientData {
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
  String? createdDate;
  String? updatedDate;

  ClientData(
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
        this.updatedDate});

  ClientData.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
