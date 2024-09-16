//Model ແມ່ນບ່ອນເກັບຂໍ້ມູນຊົ່ວຄາວທີ່ເປັນຮູບແບບ object
import 'dart:convert';

List<ProductModel> productModelFromJson(String str) =>
    List<ProductModel>.from(
      json.decode(str).map((x)=>ProductModel.fromJson(x)));

class ProductModel {
  //? ແມ່ນການໃຫ້ຫວ່າງເປົ່າໄດ້
  final String? productId;
  final String? name;
  final String? detail;
  final double? amount;
  final int? price;
  final String? image;
//contrature ແມ່ນການເອີ້ນໃຊ້ຕົວປ່ຽນ
  ProductModel({
    this.productId,
    this.name,
    this.detail,
    this.amount,
    this.price,
    this.image,
  });
//ການປ່ຽນຂໍ້ມູນໃຫ້ເປັນ json ຫຼື ເປັນ object
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        productId: json['productId'],
        name: json['name'],
        detail: json['detail'],
        amount: double.parse(json['amount'].toString()),
        price: int.parse(json['price'].toString()),
        image: json['image'],
      );
// ການປ່ຽນຂໍ້ມູນຈາກ model to json
  Map<String, dynamic> toJson() => {
        "productId": productId,
        "name": name,
        "detail": detail,
        "amount": amount,
        "price": price,
        "image": image,
      };
}
