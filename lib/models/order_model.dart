
class OrderModel {
  int? id;
  List<Order>? order;
  int? tableNumber;

  OrderModel({this.id, this.order, this.tableNumber});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['order'] != null) {
      order = <Order>[];
      json['order'].forEach((v) {
        order!.add(Order.fromJson(v));
      });
    }
    tableNumber = json['table_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (order != null) {
      data['order'] = order!.map((v) => v.toJson()).toList();
    }
    data['table_number'] = tableNumber;
    return data;
  }
}

class Order {
  String? product;
  int? count;
  String? size;
  int? price;
  int? id;

  Order({this.product, this.count, this.size, this.price, this.id});

  Order.fromJson(Map<String, dynamic> json) {
    product = json['product'];
    count = json['count'];
    size = json['size'];
    price = json['price'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product'] = product;
    data['count'] = count;
    data['size'] = size;
    data['price'] = price;
    data['id'] = id;
    return data;
  }
}
