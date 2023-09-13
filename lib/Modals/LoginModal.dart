class UserModal {
  String? status;
  String? message;
  UserData? userData;

  UserModal({this.status, this.message, this.userData});

  UserModal.fromJson(Map<dynamic, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userData = json['user_data'] != null
        ? new UserData.fromJson(json['user_data'])
        : null;
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.userData != null) {
      data['user_data'] = this.userData!.toJson();
    }
    return data;
  }
}

class UserData {
  String? uid;
  String? userName;
  String? userRole;
  String? email;
  String? password;
  String? profileImg;
  String? gender;
  String? mobile;
  String? address;
  String? createdDate;
  String? updatedDate;

  UserData(
      {this.uid,
        this.userName,
        this.userRole,
        this.email,
        this.password,
        this.profileImg,
        this.gender,
        this.mobile,
        this.address,
        this.createdDate,
        this.updatedDate});

  UserData.fromJson(Map<dynamic, dynamic> json) {
    uid = json['uid'];
    userName = json['user_name'];
    userRole = json['user_role'];
    email = json['email'];
    password = json['password'];
    profileImg = json['profile_img'];
    gender = json['gender'];
    mobile = json['mobile'];
    address = json['address'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['uid'] = this.uid;
    data['user_name'] = this.userName;
    data['user_role'] = this.userRole;
    data['email'] = this.email;
    data['password'] = this.password;
    data['profile_img'] = this.profileImg;
    data['gender'] = this.gender;
    data['mobile'] = this.mobile;
    data['address'] = this.address;
    data['created_date'] = this.createdDate;
    data['updated_date'] = this.updatedDate;
    return data;
  }
}
