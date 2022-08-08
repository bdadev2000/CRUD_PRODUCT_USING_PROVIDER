class ProductItem {
  final String id;
  final String name;
  final int price;
  final int? quantity;
  final String image;
  final String description;

  ProductItem(
      {required this.id,
      required this.name,
      required this.price, this.quantity,
      required this.image,
      required this.description});
}
