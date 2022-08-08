import 'package:add_to_cart_v1/provider/product.dart';
import 'package:flutter/material.dart';

import 'utils/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: Routes.routes,
      initialRoute: Routes.shopProductListScreen,
    );
  }
}
