class Product{
  final String image;
  final String name;
  final String description;
  final String price;
  int? count;

  Product({required this.name, required this.description, required this.price,  required this.image, this.count, });

  factory Product.fromJson(Map json){
    return Product(
      image: json["image"],
      name: json["name"],
      description: json["description"],
      price: json["price"],
      count: json['count'],
     
    );
  }
}