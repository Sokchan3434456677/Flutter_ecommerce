// import 'package:flutter/material.dart';

// class ShoppingBagPage extends StatelessWidget {
//   final List<Map<String, dynamic>> cartItems;

//   const ShoppingBagPage({super.key, required this.cartItems});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Shopping Bag'),
//         centerTitle: true,
//         actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.separated(
//               padding: const EdgeInsets.all(16),
//               itemCount: cartItems.length,
//               separatorBuilder: (context, index) => const SizedBox(height: 16),
//               itemBuilder:
//                   (context, index) => _buildBagItem(context, cartItems[index]),
//             ),
//           ),
//           _buildCheckoutSection(context),
//         ],
//       ),
//     );
//   }

//   Widget _buildBagItem(BuildContext context, Map<String, dynamic> item) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           width: 100,
//           height: 120,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             color: Colors.grey.shade200,
//             image: DecorationImage(
//               image: NetworkImage(item['image']),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         const SizedBox(width: 16),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 item['name'],
//                 style: Theme.of(context).textTheme.titleMedium,
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 'Color: ${item['color']} | Size: ${item['size']}',
//                 style: Theme.of(context).textTheme.bodySmall,
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 '\$${item['price']}',
//                 style: Theme.of(
//                   context,
//                 ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 12),
//               Row(
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.remove, size: 18),
//                     onPressed: () {},
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 12),
//                     child: Text('${item['quantity']}'),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.add, size: 18),
//                     onPressed: () {},
//                   ),
//                   const Spacer(),
//                   IconButton(
//                     icon: const Icon(Icons.delete_outline),
//                     onPressed: () {},
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildCheckoutSection(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border(top: BorderSide(color: Colors.grey.shade200, width: 1)),
//       ),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('Subtotal', style: Theme.of(context).textTheme.bodyLarge),
//               Text('\$299.97', style: Theme.of(context).textTheme.bodyLarge),
//             ],
//           ),
//           const SizedBox(height: 8),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('Shipping', style: Theme.of(context).textTheme.bodyLarge),
//               Text('Free', style: Theme.of(context).textTheme.bodyLarge),
//             ],
//           ),
//           const SizedBox(height: 16),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Total',
//                 style: Theme.of(
//                   context,
//                 ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 '\$299.97',
//                 style: Theme.of(
//                   context,
//                 ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               child: const Text('CHECKOUT'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ShoppingBagPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const ShoppingBagPage({super.key, required this.cartItems});

  @override
  State<ShoppingBagPage> createState() => _ShoppingBagPageState();
}

class _ShoppingBagPageState extends State<ShoppingBagPage> {
  late List<Map<String, dynamic>> _cartItems;

  @override
  void initState() {
    super.initState();
    _cartItems = List.from(widget.cartItems);
  }

  // Calculate subtotal
  double get _subtotal {
    return _cartItems.fold(
      0.0,
      (sum, item) =>
          sum + (double.parse(item['price']) * (item['quantity'] as int)),
    );
  }

  // Update quantity
  void _updateQuantity(int index, int newQuantity) {
    if (newQuantity >= 1) {
      setState(() {
        _cartItems[index]['quantity'] = newQuantity;
      });
    }
  }

  // Remove item from cart
  void _removeItem(int index) {
    setState(() {
      _cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey.shade100,
        title: const Text(
          'Shopping Bag',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Iconsax.search_normal_1, size: 24),
            onPressed: () {
              // Implement search functionality if needed
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body:
          _cartItems.isEmpty
              ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Iconsax.shopping_bag, size: 80, color: Colors.grey),
                    SizedBox(height: 20),
                    Text(
                      'Your shopping bag is empty',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              )
              : Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.all(20),
                      itemCount: _cartItems.length,
                      separatorBuilder:
                          (context, index) => const SizedBox(height: 20),
                      itemBuilder:
                          (context, index) =>
                              _buildBagItem(context, _cartItems[index], index),
                    ),
                  ),
                  _buildCheckoutSection(context),
                ],
              ),
    );
  }

  Widget _buildBagItem(
    BuildContext context,
    Map<String, dynamic> item,
    int index,
  ) {
    return Dismissible(
      key: Key(item['name']),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) => _removeItem(index),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        color: Colors.red,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade200,
              image: DecorationImage(
                image: AssetImage(item['image']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['name'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text(
                      'Color: ',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _parseColor(item['color']),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'Size: ${item['size']}',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  '\$${double.parse(item['price']).toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove, size: 20),
                      onPressed:
                          () => _updateQuantity(index, item['quantity'] - 1),
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
                          '${item['quantity']}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add, size: 20),
                      onPressed:
                          () => _updateQuantity(index, item['quantity'] + 1),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Iconsax.trash, color: Colors.red),
                      onPressed: () => _removeItem(index),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckoutSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Subtotal',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                '\$${_subtotal.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Shipping',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const Text(
                'Free',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Divider(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                '\$${_subtotal.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed:
                  _cartItems.isEmpty
                      ? null
                      : () {
                        // Implement checkout functionality
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Proceeding to checkout'),
                          ),
                        );
                      },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                disabledBackgroundColor: Colors.grey.shade300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'CHECKOUT',
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
    );
  }

  // Helper function to parse color string to Color object
  Color _parseColor(String colorString) {
    try {
      String valueString = colorString.split('(0x')[1].split(')')[0];
      int value = int.parse(valueString, radix: 16);
      return Color(value);
    } catch (e) {
      return Colors.grey;
    }
  }
}
