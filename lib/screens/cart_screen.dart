import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/cart_item_card.dart';
import 'checkout_screen.dart';

class CartScreen extends StatefulWidget {
  final List<Product> cartItems;
  final Function(Product) onRemoveFromCart;

  const CartScreen({
    super.key,
    required this.cartItems,
    required this.onRemoveFromCart,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double get _totalPrice {
    return widget.cartItems.fold(0, (sum, item) => sum + item.price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color(0xFFF8F9FA),
       appBar: AppBar(
         backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
         title: const Text(
          'Cart',
          style: TextStyle(
             color: Colors.black,
             fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: widget.cartItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey[400]),
                  const SizedBox(height: 16),
                  Text(
                    'Your cart is empty',
                     style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                   const SizedBox(height: 8),
                  Text(
                    'Add items to start shopping',
                     style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                return CartItemCard(
                  product: widget.cartItems[index],
                  onRemove: () {
                    widget.onRemoveFromCart(widget.cartItems[index]);
                    setState(() {});
                  },
                );
              },
            ),
      bottomNavigationBar: widget.cartItems.isEmpty
          ? null
          : Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ]
              ),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total:',
                           style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                           '\$${_totalPrice.toStringAsFixed(0)}',
                           style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                             color: Colors.blue
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                       children: [
                          Icon(Icons.info_outline, size: 16, color: Colors.grey[600]),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Lorem Ipsum is simply dummy text of the printing.',
                              style: TextStyle(
                                 fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                       ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                           Navigator.push(
                             context,
                             MaterialPageRoute(
                               builder: (context) => const CheckoutScreen(),
                             ),
                           );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                         child: const Text(
                           'Checkout',
                           style: TextStyle(
                             fontSize: 16,
                             fontWeight: FontWeight.bold,
                              color: Colors.white
                           ),
                         ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
