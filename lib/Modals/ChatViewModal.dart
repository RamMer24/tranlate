class ChatViewModal {
  String? message;
  String? status;
  List<AllChat>? allChat;

  ChatViewModal({this.message, this.status, this.allChat});

  ChatViewModal.fromJson(Map<String, dynamic> json) {
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
  String? fromName;
  String? toName;
  String? time;

  AllChat(
      {this.chatId,
        this.fromUserId,
        this.toUserId,
        this.messageType,
        this.messages,
        this.status,
        this.createdDate,
        this.updatedDate,
        this.fromName,
        this.toName,
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
    fromName = json['from_name'];
    toName = json['to_name'];
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
    data['from_name'] = this.fromName;
    data['to_name'] = this.toName;
    data['time'] = this.time;
    return data;
  }
}
