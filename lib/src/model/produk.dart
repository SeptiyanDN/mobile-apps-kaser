class Produk {
  int? id;
  String? sku;
  int? qty;
  int? price;
  String? unit;

  Produk({this.id, this.sku, this.qty, this.price, this.unit});

  Produk.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sku = json['sku'];
    qty = json['qty'];
    price = json['price'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['sku'] = sku;
    data['qty'] = qty;
    data['price'] = price;
    data['unit'] = unit;
    return data;
  }
}
