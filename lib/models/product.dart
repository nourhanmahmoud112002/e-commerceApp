class Product {
  int id;
  String title;
  String description;
  int price;
  var discountPercentage;
  var rate;
  int stock;
  String brand;
  String category;
  String thumbnail; // small image
  List<dynamic> images;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rate,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });
  factory Product.fromjson(Map<String, dynamic> data) {
    return Product(
        id: data['id'],
        title: data['title'],
        description: data['description'],
        price: data['price'],
        discountPercentage: data['discountPercentage'],
        rate: data['rating'],
        stock: data['stock'],
        brand: data['brand'],
        category: data['category'],
        thumbnail: data['thumbnail'],
        images: data['images']);
  }
}
