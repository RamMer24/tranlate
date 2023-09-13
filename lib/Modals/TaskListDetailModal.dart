class TaskListDetailModal {
  String? message;
  String? status;
  TaskData? taskData;

  TaskListDetailModal({this.message, this.status, this.taskData});

  TaskListDetailModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    taskData = json['task_data'] != null
        ? new TaskData.fromJson(json['task_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.taskData != null) {
      data['task_data'] = this.taskData!.toJson();
    }
    return data;
  }
}

class TaskData {
  String? taskId;
  String? clientId;
  String? taskName;
  String? taskDescription;
  String? taskType;
  String? assignTo;
  String? startTime;
  String? endTime;
  String? taskAmount;
  String? status;
  String? fromLanguage;
  String? toLanguage;
  String? createdDate;
  String? updatedDate;
  String? invoiceId;
  String? assignToName;
  String? clientName;
  String? fromLanguageName;
  String? toLanguageName;
  String? totalHours;

  TaskData(
      {this.taskId,
        this.clientId,
        this.taskName,
        this.taskDescription,
        this.taskType,
        this.assignTo,
        this.startTime,
        this.endTime,
        this.taskAmount,
        this.status,
        this.fromLanguage,
        this.toLanguage,
        this.createdDate,
        this.updatedDate,
        this.invoiceId,
        this.assignToName,
        this.clientName,
        this.fromLanguageName,
        this.toLanguageName,
        this.totalHours});

  TaskData.fromJson(Map<String, dynamic> json) {
    taskId = json['task_id'];
    clientId = json['client_id'];
    taskName = json['task_name'];
    taskDescription = json['task_description'];
    taskType = json['task_type'];
    assignTo = json['assign_to'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    taskAmount = json['task_amount'];
    status = json['status'];
    fromLanguage = json['from_language'];
    toLanguage = json['to_language'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
    invoiceId = json['invoice_id'];
    assignToName = json['assign_to_name'];
    clientName = json['client_name'];
    fromLanguageName = json['from_language_name'];
    toLanguageName = json['to_language_name'];
    totalHours = json['total_hours'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['task_id'] = this.taskId;
    data['client_id'] = this.clientId;
    data['task_name'] = this.taskName;
    data['task_description'] = this.taskDescription;
    data['task_type'] = this.taskType;
    data['assign_to'] = this.assignTo;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['task_amount'] = this.taskAmount;
    data['status'] = this.status;
    data['from_language'] = this.fromLanguage;
    data['to_language'] = this.toLanguage;
    data['created_date'] = this.createdDate;
    data['updated_date'] = this.updatedDate;
    data['invoice_id'] = this.invoiceId;
    data['assign_to_name'] = this.assignToName;
    data['client_name'] = this.clientName;
    data['from_language_name'] = this.fromLanguageName;
    data['to_language_name'] = this.toLanguageName;
    data['total_hours'] = this.totalHours;
    return data;
  }
}
