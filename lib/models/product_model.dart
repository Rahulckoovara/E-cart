class ProductModel {
  final int id;
  final String title;
  final String description;
  final double? price;
  final String category;
  final String image;
  //final Rating rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.image,
    // required this.rating
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      category: json['category'],
      image: json['image'],
      // rating: Rating(
      //     rate: json['rating']['rate'].toDouble(),
      //     count: json['rating']['count']),
    );
  }
}

// class Rating {
//   final double rate;
//   final int count;

//   Rating({required this.rate, required this.count});
// }
