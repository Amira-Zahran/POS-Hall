class Orders {
  int? id;
  int? orderId;
  String? status;
  String? type;

  Orders({this.id, this.orderId, this.status, this.type});

  factory Orders.fromJson(Map<String, dynamic> json) {
    return Orders(
    id : json['id'],
    orderId : json['order_id'],
    status : json['status'],
    type : json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['status'] = this.status;
    data['type'] = this.type;
    return data;
  }
}