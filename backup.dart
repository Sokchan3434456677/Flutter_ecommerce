import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_a3/Utils/color.dart';
import 'package:flutter_application_a3/Widgets/curated_item.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_application_a3/Widgets/banner.dart';
import 'package:flutter_application_a3/Model/category_model.dart';
import 'package:flutter_application_a3/Model/model.dart';

class AppHomeScreen extends StatefulWidget {
  const AppHomeScreen({super.key});

  @override
  State<AppHomeScreen> createState() => _AppHomeScreenState();
}

class _AppHomeScreenState extends State<AppHomeScreen> {
  // Reusable category item widget
  Widget _buildCategoryItem(Facategory category) {
    Size size = MediaQuery.of(context).size;
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
    Size size = MediaQuery.of(context).size; // Added size definition

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
                    Stack(
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
                                "3",
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(FashionEcommercesApp.length, (index) {
                    final eCommerceItem = FashionEcommercesApp[index];
                    return Padding(
                      padding:
                          index == 0
                              ? const EdgeInsets.symmetric(horizontal: 20)
                              : const EdgeInsets.only(right: 20),
                      child: InkWell(
                        onTap: () {},
                        child: CuratedItem(
                          eCommerceItem: eCommerceItem,
                          size: size,
                        ),
                      ),
                    );
                  }),
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
