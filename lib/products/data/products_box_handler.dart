import 'package:hive/hive.dart';
import 'package:listins/products/model/product.dart';

class ProductsBoxHandler {
  late Box _box;

  Future<void> openBox(String ListinId) async{
    _box = await Hive.openBox(ListinId);

  }

  Future<void> closeBox() async {
    return _box.close();
  }

  Future<int> insertProduct(Product product) async{
    return _box.add(product);
  }

  List<Product> getProducts(){
    return _box.values.map((element) => element as Product).toList();
  }

  Future<void> updateProduct(Product product) async{
    return product.save();
  }

  Future<void> deleteProduct(Product product) async {
    return _box.delete(product.key);
  }
}