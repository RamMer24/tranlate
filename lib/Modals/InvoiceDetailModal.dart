class InvoiceDetailModal {
  String? status;
  InvoiceData? invoiceData;

  InvoiceDetailModal({this.status, this.invoiceData});

  InvoiceDetailModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    invoiceData = json['invoice_data'] != null
        ? new InvoiceData.fromJson(json['invoice_data'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.invoiceData != null) {
      data['invoice_data'] = this.invoiceData!.toJson();
    }
    return data;
  }
}

class InvoiceData {
  String? invId;
  String? invoiceNumber;
  String? status;
  String? amount;
  String? dueDate;
  String? createdDate;
  String? taskName;
  String? taskDescription;
  String? startTime;
  String? endTime;
  String? taskAmount;
  String? taskType;
  String? totalTime;
  String? totalAmount;

  InvoiceData(
      {this.invId,
        this.invoiceNumber,
        this.status,
        this.amount,
        this.dueDate,
        this.createdDate,
        this.taskName,
        this.taskDescription,
        this.startTime,
        this.endTime,
        this.taskAmount,
        this.taskType,
        this.totalTime,
        this.totalAmount});

  InvoiceData.fromJson(Map<String, dynamic> json) {
    invId = json['inv_id'];
    invoiceNumber = json['invoice_number'];
    status = json['status'];
    amount = json['Amount'];
    dueDate = json['due_date'];
    createdDate = json['created_date'];
    taskName = json['task_name'];
    taskDescription = json['task_description'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    taskAmount = json['task_amount'];
    taskType = json['task_type'];
    totalTime = json['total_time'];
    totalAmount = json['total_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['inv_id'] = this.invId;
    data['invoice_number'] = this.invoiceNumber;
    data['status'] = this.status;
    data['Amount'] = this.amount;
    data['due_date'] = this.dueDate;
    data['created_date'] = this.createdDate;
    data['task_name'] = this.taskName;
    data['task_description'] = this.taskDescription;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['task_amount'] = this.taskAmount;
    data['task_type'] = this.taskType;
    data['total_time'] = this.totalTime;
    data['total_amount'] = this.totalAmount;
    return data;
  }
}
