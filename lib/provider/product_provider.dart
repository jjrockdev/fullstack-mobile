import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/components/message_helper.dart';
import 'package:restaurant_app/models/product_model.dart';
import 'package:restaurant_app/services/product_service.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> _productModel = [];
  bool _loading = false;
  List<ProductModel> get productModel => _productModel;
  bool get loading => _loading;

  Future<void> getProduct() async {
    try {
      final result = await ProductService().getProduct();
      if (result.length > 0) {
        _productModel = result;
        _loading = false;
        MessageHelper.showMessage(true, "Get Product Success");
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      MessageHelper.showMessage(false, e.toString());
      notifyListeners();
    }
  }
}
