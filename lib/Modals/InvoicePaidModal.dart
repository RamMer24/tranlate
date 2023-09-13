class InvoicePaidModal {
  String? status;
  List<InvoiceData>? invoiceData;

  InvoicePaidModal({this.status, this.invoiceData});

  InvoicePaidModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['invoice_data'] != null) {
      invoiceData = <InvoiceData>[];
      json['invoice_data'].forEach((v) {
        invoiceData!.add(new InvoiceData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.invoiceData != null) {
      data['invoice_data'] = this.invoiceData!.map((v) => v.toJson()).toList();
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
  int? leftDays;
  String? startDate;

  InvoiceData(
      {this.invId,
        this.invoiceNumber,
        this.status,
        this.amount,
        this.dueDate,
        this.createdDate,
        this.taskName,
        this.taskDescription,
        this.leftDays,
        this.startDate});

  InvoiceData.fromJson(Map<String, dynamic> json) {
    invId = json['inv_id'];
    invoiceNumber = json['invoice_number'];
    status = json['status'];
    amount = json['Amount'];
    dueDate = json['due_date'];
    createdDate = json['created_date'];
    taskName = json['task_name'];
    taskDescription = json['task_description'];
    leftDays = json['left_days'];
    startDate = json['start_date'];
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
    data['left_days'] = this.leftDays;
    data['start_date'] = this.startDate;
    return data;
  }
}
