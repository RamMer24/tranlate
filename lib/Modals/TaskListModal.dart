class TaskListModal {
  String? message;
  String? status;
  List<ClientData>? clientData;

  TaskListModal({this.message, this.status, this.clientData});

  TaskListModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['client_data'] != null) {
      clientData = <ClientData>[];
      json['client_data'].forEach((v) {
        clientData!.add(new ClientData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.clientData != null) {
      data['client_data'] = this.clientData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClientData {
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
  String? totalHours;

  ClientData(
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
         this.totalHours});

  ClientData.fromJson(Map<String, dynamic> json) {
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
     totalHours = json['total_hours'];
  }

  Map<String, dynamic> toJson() {
     final Map<String, dynamic> data = new Map<String, dynamic>();
     data['task_id'] = this.taskId;
     data['client_id'] = this.clientId;
     data['task_name'] = this.taskName;
     data['task_description'] = this.taskDescription;
     data['task_type'] =   this.    taskType;
     data['assign_to'] =   this.    assignTo;
     data['start_time'] =  this.   startTime;
     data['end_time'] =    this.     endTime;
     data['task_amount'] = this.  taskAmount;
     data['status'] =      this.       status;
     data['from_language'] = this.fromLanguage;
     data['to_language'] = this.  toLanguage;
     data['created_date'] = this. createdDate;
     data['updated_date'] = this. updatedDate;
     data['total_hours'] = this.  totalHours;
    return data;
  }
}
