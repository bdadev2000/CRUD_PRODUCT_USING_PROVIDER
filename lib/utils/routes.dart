import 'package:add_to_cart_v1/data/data.dart';
import 'package:add_to_cart_v1/ui/product_admin/shop_product_list_screen.dart';
import 'package:add_to_cart_v1/ui/product_admin/shop_product_update.dart';
class Routes{
  Routes._();
  static const String shopProductListScreen = '/shop_product_list_screen';
  static const String shopProductUpdate = '/shop_product_update_screen';

  static var routes = {
    shopProductListScreen : (context) => ShopProductListScreen(items: productItems),
    shopProductUpdate : (context) => ShopProductUpdate(),
  };


}