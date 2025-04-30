import 'package:flutter/material.dart';
import 'package:flutter_application_a3/Model/model.dart';
import 'package:flutter_application_a3/Utils/color.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_application_a3/Views/shoping_bag.dart';

class ItemsDetailScreen extends StatefulWidget {
  final AppModel eCommerceApp;
  const ItemsDetailScreen({super.key, required this.eCommerceApp});

  @override
  State<ItemsDetailScreen> createState() => _ItemsDetailScreenState();
}

class _ItemsDetailScreenState extends State<ItemsDetailScreen> {
  int currentIndex = 0;
  int selectedColorIndex = 0;
  int selectedSizeIndex = 0;
  bool isFavorite = false;
  int quantity = 1;

  final List<Color> availableColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
  ];

  final List<String> availableSizes = ['S', 'M', 'L', 'XL', 'XXL'];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: fbackgroundColor2,
        title: const Text("Detail Product"),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShoppingBagPage(cartItems: []),
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
                        "0",
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
          const SizedBox(width: 20),
        ],
      ),
      body: ListView(
        children: [
          // Product Images Section
          Container(
            color: fbackgroundColor2,
            height: size.height * 0.46,
            width: size.width,
            child: Stack(
              children: [
                PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Image.asset(
                          widget.eCommerceApp.image,
                          width: size.width * 0.85,
                          height: size.height * 0.4,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  },
                ),
                // Favorite Button
                Positioned(
                  top: 20,
                  right: 20,
                  child: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.black,
                      size: 30,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                  ),
                ),
                // Page Indicator
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.only(right: 4),
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              index == currentIndex
                                  ? Colors.blue
                                  : Colors.grey.shade400,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Product Info Section
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Name and Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.eCommerceApp.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "\$${widget.eCommerceApp.price.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // Rating and Reviews
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 20),
                    const SizedBox(width: 5),
                    Text(
                      widget.eCommerceApp.rating.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${widget.eCommerceApp.reviewCount} Reviews",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Description
                const Text(
                  "Description",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  "This is a detailed description of the product. It includes information about materials, features, and benefits. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 20),

                // Color Selection
                const Text(
                  "Color",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: availableColors.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedColorIndex = index;
                          });
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          margin: const EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                            color: availableColors[index],
                            shape: BoxShape.circle,
                            border: Border.all(
                              color:
                                  selectedColorIndex == index
                                      ? Colors.black
                                      : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child:
                              selectedColorIndex == index
                                  ? const Center(
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  )
                                  : null,
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),

                // Size Selection
                const Text(
                  "Size",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: availableSizes.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSizeIndex = index;
                          });
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          margin: const EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                            color:
                                selectedSizeIndex == index
                                    ? Colors.blue
                                    : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              availableSizes[index],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color:
                                    selectedSizeIndex == index
                                        ? Colors.white
                                        : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),

                // Quantity Selector
                const Text(
                  "Quantity",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (quantity > 1) quantity--;
                        });
                      },
                    ),
                    Container(
                      width: 50,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          quantity.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // Add to Cart Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      final selectedItem = {
                        'name': widget.eCommerceApp.name,
                        'image': widget.eCommerceApp.image,
                        'price': widget.eCommerceApp.price.toStringAsFixed(2),
                        'color': availableColors[selectedColorIndex].toString(),
                        'size': availableSizes[selectedSizeIndex],
                        'quantity': quantity,
                      };

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  ShoppingBagPage(cartItems: [selectedItem]),
                        ),
                      );
                    },
                    child: const Text(
                      "Add to Cart",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
