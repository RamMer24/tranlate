class CommentTaskModal {
  String? message;
  String? status;
  List<Data>? data;

  CommentTaskModal({this.message, this.status, this.data});

  CommentTaskModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? commentId;
  String? userId;
  String? taskId;
  String? comment;
  String? createdDate;
  String? updatedDate;
  String? taskName;
  String? taskDescription;
  String? status;
  String? startTime;
  String? taskType;
  String? endTime;
  String? taskDate;
  String? userName;
  String? commentTime;
  String? totalHour;

  Data(
      {this.commentId,
        this.userId,
        this.taskId,
        this.comment,
        this.createdDate,
        this.updatedDate,
        this.taskName,
        this.taskDescription,
        this.status,
        this.startTime,
        this.taskType,
        this.endTime,
        this.taskDate,
        this.userName,
        this.commentTime,
        this.totalHour});

  Data.fromJson(Map<String, dynamic> json) {
    commentId = json['comment_id'];
    userId = json['user_id'];
    taskId = json['task_id'];
    comment = json['comment'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
    taskName = json['task_name'];
    taskDescription = json['task_description'];
    status = json['status'];
    startTime = json['start_time'];
    taskType = json['task_type'];
    endTime = json['end_time'];
    taskDate = json['task_date'];
    userName = json['user_name'];
    commentTime = json['comment_time'];
    totalHour = json['total_hour'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment_id'] = this.commentId;
    data['user_id'] = this.userId;
    data['task_id'] = this.taskId;
    data['comment'] = this.comment;
    data['created_date'] = this.createdDate;
    data['updated_date'] = this.updatedDate;
    data['task_name'] = this.taskName;
    data['task_description'] = this.taskDescription;
    data['status'] = this.status;
    data['start_time'] = this.startTime;
    data['task_type'] = this.taskType;
    data['end_time'] = this.endTime;
    data['task_date'] = this.taskDate;
    data['user_name'] = this.userName;
    data['comment_time'] = this.commentTime;
    data['total_hour'] = this.totalHour;
    return data;
  }
}
