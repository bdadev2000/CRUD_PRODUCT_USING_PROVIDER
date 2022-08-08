import 'package:add_to_cart_v1/models/ProductItem.dart';
import 'package:flutter/material.dart';

class ShopProductUpdate extends StatefulWidget {
  const ShopProductUpdate({Key? key, this.item}) : super(key: key);
  final ProductItem? item;
  @override
  State<ShopProductUpdate> createState() => _ShopProductUpdateState();
}

class _ShopProductUpdateState extends State<ShopProductUpdate> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _initValue = {
    'id': '-1',
    'name': '',
    'price': 0,
    'description': '',
    'image': '',
  };


  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)!.settings.arguments as ProductItem;
    if(args != null){
      initValues(args);
    }
    super.didChangeDependencies();
  }

  void initValues(ProductItem? item) {
    _initValue['id'] = item?.id;
    _initValue['name'] = item?.name;
    _initValue['price'] = item?.price.toString();
    _initValue['description'] = item?.description;
    _initValue['image'] = item?.image;
    // if (item?.image != null) {
    //   _imageControler.text = item!.image;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Update Product"),
        actions: [
          IconButton(
            onPressed: () {
              _saveForm();
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _initValue['name'],
                decoration: InputDecoration(
                  hintText: "Enter your name",
                ),
                onSaved: (String? value) {
                  _initValue['name'] = value ?? '';
                },
              ),
              TextFormField(
                initialValue: _initValue['price'],
                decoration: InputDecoration(
                  hintText: "Enter your price",
                ),
                onSaved: (String? value) {
                  _initValue['price'] = value ?? '';
                },
              ),
              TextFormField(
                initialValue: _initValue['image'],
                decoration: InputDecoration(
                  hintText: "Enter your image",
                ),
                onSaved: (String? value) {
                  _initValue['image'] = value ?? '';
                },
              ),
              TextFormField(
                initialValue: _initValue['description'],
                decoration: InputDecoration(
                  hintText: "Enter your description",
                ),
                onSaved: (String? value) {
                  _initValue['description'] = value ?? '';
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void _saveForm() {
    _formKey.currentState?.save();
    Navigator.pop(
      context,
      ProductItem(
          id: _initValue['id'],
          image: _initValue['image'],
          price: int.parse(_initValue['price']),
          description: _initValue['description'],
          name: _initValue['name']),
    );
  }
}
