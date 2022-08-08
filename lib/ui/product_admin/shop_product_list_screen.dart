import 'package:add_to_cart_v1/provider/product.dart';
import 'package:add_to_cart_v1/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/ProductItem.dart';

class ShopProductListScreen extends StatefulWidget {
  const ShopProductListScreen({Key? key, required this.items})
      : super(key: key);
  final List<ProductItem> items;

  @override
  State<ShopProductListScreen> createState() => _ShopProductListScreenState();
}

class _ShopProductListScreenState extends State<ShopProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Consumer<ProductProvider>(
          builder: (context,snapshot,child){
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.menu),
                ),
                title: Text("Product List Admin"),
                actions: [
                  IconButton(
                    onPressed: () async{
                      final result = await Navigator.pushNamed(context, Routes.shopProductUpdate);
                      // setState(() {
                      //   if(result != null)
                      //     {
                      //       widget.items.add(result as ProductItem);
                      //       widget.items.sort((a,b)=>a.name.compareTo(b.name),);
                      //     }
                      // });
                      if(result != null){
                        snapshot.addProduct(result as ProductItem);
                      }
                    },
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
              body: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final ProductItem item = snapshot.items[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(item.image),
                        ),
                        title: Text(item.name),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () async{
                                final result = await Navigator.pushNamed(context, Routes.shopProductUpdate,arguments: item);
                                // if(result!=null){
                                //   setState(() {
                                //     widget.items[index] = (result as ProductItem);
                                //     widget.items.sort((a,b)=>a.name.compareTo(b.name));
                                //   });
                                // }
                                snapshot.updateProduct(result as ProductItem);
                              },
                              icon: Icon(Icons.edit),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  // widget.items.remove(item);
                                  snapshot.removeProduct(item);
                                });

                              },
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: widget.items.length),
              ),
            );
          },
        ));
  }
}
