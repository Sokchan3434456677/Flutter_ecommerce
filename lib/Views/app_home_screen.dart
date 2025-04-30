import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_application_a3/Model/category_model.dart';
import 'package:flutter_application_a3/Model/model.dart';
import 'package:flutter_application_a3/Widgets/banner.dart';
import 'package:flutter_application_a3/Views/items_detail_screen.dart';
import 'package:flutter_application_a3/Views/shoping_bag.dart';

class AppHomeScreen extends StatefulWidget {
  const AppHomeScreen({super.key});

  @override
  State<AppHomeScreen> createState() => _AppHomeScreenState();
}

class _AppHomeScreenState extends State<AppHomeScreen> {
  // Reusable category item widget
  Widget _buildCategoryItem(Facategory category) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[200],
            ),
            child: Center(
              child: Image.asset(
                category.image,
                width: 40,
                height: 40,
                errorBuilder:
                    (context, error, stackTrace) =>
                        const Icon(Icons.category, size: 40),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            category.name,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  // Reusable section header
  Widget _buildSectionHeader(String title, {bool showSeeAll = true}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          if (showSeeAll)
            Text(
              "See All",
              style: TextStyle(fontSize: 16, color: Colors.black45),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App Bar
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/image.png", height: 40),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    const ShoppingBagPage(cartItems: []),
                          ),
                        );
                      },
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const Icon(Iconsax.shopping_bag, size: 28),
                          Positioned(
                            right: -3,
                            top: -5,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                child: Text(
                                  "",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Banner Section
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: MyBanner(),
              ),

              // Shop By Category Section
              const SizedBox(height: 25),
              _buildSectionHeader("Shop By Category"),
              const SizedBox(height: 15),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 10),
                  itemCount: productCategories.length,
                  itemBuilder: (context, index) {
                    return _buildCategoryItem(productCategories[index]);
                  },
                ),
              ),
              const SizedBox(height: 10),

              // Featured Products Section
              _buildSectionHeader("Featured Products"),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: FashionEcommercesApp.length,
                  itemBuilder: (context, index) {
                    final item = FashionEcommercesApp[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    ItemsDetailScreen(eCommerceApp: item),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Product Image
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.grey[100],
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          item.image,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  const Icon(
                                                    Icons.image_not_supported,
                                                  ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  // Product Title
                                  Text(
                                    item.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  // Price
                                  Text(
                                    "\$${item.price.toStringAsFixed(2)}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  // Rating and Reviews
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 17,
                                      ),
                                      Text(
                                        item.rating.toString(),
                                        style: const TextStyle(
                                          color: Colors.black45,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        "${item.reviewCount} Reviews",
                                        style: const TextStyle(
                                          color: Colors.black26,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // Favorite Button
                            Positioned(
                              top: 8,
                              right: 8,
                              child: IconButton(
                                icon: const Icon(Icons.favorite_border),
                                color: Colors.black45,
                                onPressed: () {
                                  // Add favorite functionality here
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
