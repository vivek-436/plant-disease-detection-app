class Product {
  final String title;
  final String image;
  final double price;
  final double rating;
  final int review;

  Product(
    this.review, {
    required this.title,
    required this.image,
    required this.price,
    required this.rating,
  });
}

final List<Product> productlist = [
  Product(
    239,
    title: "Replex",
    image: 'assets/a.png',
    price: 150,
    rating: 4,
  ),
  Product(235,
      title: "wheat Seed", image: 'assets/crop.png', price: 147, rating: 4),
  Product(230,
      title: "Cloud Farm Lily Plant",
      image: 'assets/nurse.png',
      price: 169,
      rating: 4),
  Product(120,
      title: "Headphones", image: "assets/volstar.png", price: 844, rating: 4),
  Product(112,
      title: "Smart Watch", image: "assets/tractor.png", price: 844, rating: 4),
  Product(143, title: "Laptop", image: "assets/.png", price: 844, rating: 4),
];
