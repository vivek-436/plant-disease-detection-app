// import 'package:agro_gaurdian/utils/colors.dart';
// import 'package:flutter/material.dart';

// import '../catagory/product.dart';

// class ProductCard extends StatelessWidget {
//   final Product product;

//   const ProductCard({
//     super.key,
//     required this.product,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.teal[50],
//       body: Padding(
//         padding: const EdgeInsets.only(top: 60),
//         child: ListView.separated(
//           padding: const EdgeInsets.all(10),
//           scrollDirection: Axis.vertical,
//           itemCount: 1,
//           physics: const BouncingScrollPhysics(),
//           itemBuilder: (context, index) {
//             return Column(
//               children: [
//                 TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Search any Prroducts',
//                     prefixIcon: const Icon(Icons.search, color: Colors.black),
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30.0),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Stack(
//                   children: [
//                     Container(
//                       height: 120,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: Colors.teal),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             SizedBox(
//                               height: 120,
//                               width: 150,
//                               child: Image.asset(
//                                 product.image,
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 20, top: 20),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   SizedBox(
//                                     height: 30,
//                                     width: 100,
//                                     child: Text(
//                                       product.title,
//                                       style: const TextStyle(
//                                         fontWeight: FontWeight.w800,
//                                         fontSize: 20,
//                                       ),
//                                     ),
//                                   ),
//                                   Text(
//                                     "Price : \Rs${product.price}",
//                                     style: const TextStyle(
//                                       fontWeight: FontWeight.w800,
//                                       fontSize: 20,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             );
//           },
//           separatorBuilder: (BuildContext context, int index) {
//             return const SizedBox(
//               height: 10,
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });
}

class ProductCard extends StatefulWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  List<Product> products = [
    Product(
      id: '1',
      name: 'Wheat',
      description: 'Good quality wheat',
      imageUrl:
          'https://i.pinimg.com/564x/db/36/78/db36789a1740e4972b8c6d8a8b0d514f.jpg',
      price: 500.00,
    ),
    Product(
      id: '2',
      name: 'Replex',
      description:
          'Being the leading names in industry we are engaged in offering a wide range of Replex Pesticide (Fipronil 5% S.C.). Offered products are available in accurate compositions and are used for various types of plants for killing worms and pests. These are formulated by highly skilled professionals using quality chemicals and ingredients as per the set industrial standards and norms. We offer our products in market at very economical prices.',
      imageUrl:
          'https://www.agroinfomart.com/premium-img/Volkschem-Crop-Science-Pvt-Ltd/FIPRONIL-5-EC-1526123576.png',
      price: 150.00,
    ),
  ];

  List<Product> cart = [];
  List<Product> savedProducts = [];

  void _addToCart(Product product) {
    setState(() {
      cart.add(product);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('${product.name} added to cart!'),
    ));
  }

  void _saveProduct(Product product) {
    setState(() {
      savedProducts.add(product);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('${product.name} saved!'),
    ));
  }

  void _shareProduct(Product product) {
    // Logic to share the product (via URL, social media, etc.)
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Shared ${product.name}'),
    ));
  }

  void _viewDetails(Product product) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ProductDetailScreen(product: product),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AgroGuardian'),
        backgroundColor: Colors.teal[50],
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to cart screen
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          _buildCategoryTabs(),
          Expanded(child: _buildProductList()),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: 'Search any categories',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildCategoryButton('All'),
          _buildCategoryButton('Pesticides'),
          _buildCategoryButton('Crops'),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String category) {
    return ElevatedButton(
      onPressed: () {
        // Filter the product list based on category
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(category),
    );
  }

  Widget _buildProductList() {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return _buildProductCard(product);
      },
    );
  }

  Widget _buildProductCard(Product product) {
    return Card(
      elevation: 4,
      shadowColor: Colors.grey[100],
      color: Colors.grey[300],
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(product.imageUrl),
                  radius: 25,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Price: ${product.price.toString()}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () => _viewDetails(product),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text(
                    'Read more',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () => _saveProduct(product),
                  icon: const Icon(
                    Icons.favorite_border,
                    size: 20,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                ElevatedButton.icon(
                  onPressed: () => _shareProduct(product),
                  icon: const Icon(
                    Icons.share,
                    size: 20,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Share',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                ElevatedButton.icon(
                  onPressed: () => _addToCart(product),
                  icon: const Icon(
                    Icons.shopping_cart,
                    size: 20,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Add to cart',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.teal[50],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.imageUrl,
                height: 200, width: double.infinity),
            const SizedBox(height: 16),
            Text(
              product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              product.description,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text(
              'Price: \Rs${product.price}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Add to cart logic
              },
              child: const Text(
                'Add to Cart',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
