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
      title: "Tamransh Cheery Palak Seeds Seed",
      image: 'assets/products/crops.png',
      price: 147,
      rating: 4),
  Product(230,
      title: "Cloud Farm Peace Lily Plant",
      image: 'assets/products/nursey.png',
      price: 169,
      rating: 4),
  Product(120,
      title: "Headphones",
      image: "assets/products/Wireless.png",
      price: 844,
      rating: 4),
  Product(112,
      title: "Smart Watch",
      image: "assets/products/watch.png",
      price: 844,
      rating: 4),
  Product(143,
      title: "Laptop", image: "assets/products/Tv.png", price: 844, rating: 4),
];
