import 'package:flutter/material.dart';
import 'package:agro_gaurdian/Screens/product_page.dart';

// Home Screen Page
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search any categories',
              prefixIcon: const Icon(Icons.search, color: Colors.black),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              children: [
                InkWell(
                  child:
                      buildCategoryCard('Pesticides', 'assets/pesticides.png'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const ProductCard()));
                  },
                ),
                InkWell(
                  child: buildCategoryCard('Crops', 'assets/crops.png'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const ProductCard()));
                  },
                ),
                InkWell(
                  child:
                      buildCategoryCard('Nursery Plants', 'assets/nursery.png'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const ProductCard()));
                  },
                ),
                InkWell(
                  child: buildCategoryCard('Poultry', 'assets/poultry.png'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const ProductCard()));
                  },
                ),
                InkWell(
                  child:
                      buildCategoryCard('Apiculture', 'assets/apiculture.png'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const ProductCard()));
                  },
                ),
                InkWell(
                  child: buildCategoryCard('Drip Pipelines', 'assets/drip.png'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const ProductCard()));
                  },
                ),
                buildCategoryCard('Tractors', 'assets/tractor.png'),
                buildCategoryCard('Rentals', 'assets/rentals.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to create category cards
  Widget buildCategoryCard(String title, String iconPath) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      color: Colors.teal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath, height: 50), // Replace with your icon paths
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
